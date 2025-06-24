use crate::common::APP;
use crate::common::Package;
use crate::common::get_toml_config;
use clap::ArgGroup;
use clap::Subcommand;
use serde::Deserialize;
use std::collections::HashMap;
use std::collections::HashSet;
use std::env;
use std::fs;
use std::io::Write;
use std::process::Command;
use std::process::Stdio;
use toml_edit::Array;
use toml_edit::DocumentMut;
use toml_edit::table;
use toml_edit::value;

const BREW: &str = "brew";
const MAS: &str = "mas";

#[derive(Debug, Subcommand)]
pub enum BrewCommand {
    #[command(name = "sync")]
    Sync {
        #[arg(short = 'r', long = "refresh")]
        refresh: bool,
        #[arg(short = 'u', long = "upgrade")]
        upgrade: bool,
        #[arg(short = 'p', long = "purge")]
        purge: bool,
    },
    #[command(name = "install", group(ArgGroup::new("type").required(true).args(["cask", "mas_app_id"])))]
    Install {
        app: String,
        #[arg(short = 'c', long = "cask")]
        cask: bool,
        #[arg(short = 'm', long = "mas")]
        mas_app_id: Option<i64>,
    },
}

#[derive(Debug, Deserialize)]
struct BrewConfig {
    #[serde(default, rename = "tap")]
    taps: HashSet<String>,
    #[serde(default, rename = "formula")]
    formulae: HashMap<String, FormulaConfig>,
    #[serde(default, rename = "cask")]
    casks: HashMap<String, CaskConfig>,
    #[serde(default, rename = "mas")]
    mas_apps: HashMap<String, MasConfig>,
}

#[derive(Debug, Deserialize)]
struct FormulaConfig {
    #[serde(default)]
    profile: String,
    #[serde(default)]
    os: String,
    #[serde(default)]
    arch: String,
}

#[derive(Debug, Deserialize)]
struct CaskConfig {
    #[serde(default)]
    profile: String,
    #[serde(default)]
    os: String,
    #[serde(default)]
    arch: String,
}

#[derive(Debug, Deserialize)]
struct MasConfig {
    #[serde(default)]
    profile: String,
    #[serde(default)]
    os: String,
    #[serde(default)]
    arch: String,
    #[serde(default)]
    id: i64,
}

impl BrewCommand {
    pub fn execute(&self) {
        if env::consts::OS != "macos" {
            println!("Brew commands only work on MacOS");
            return;
        }
        match self {
            BrewCommand::Sync {
                refresh,
                upgrade,
                purge,
            } => self.sync(*refresh, *upgrade, *purge),
            BrewCommand::Install {
                app,
                cask,
                mas_app_id,
            } => self.install(app, *cask, mas_app_id.as_ref()),
        }
    }

    fn sync(&self, refresh: bool, upgrade: bool, purge: bool) {
        let file = get_toml_config(APP, "brew");
        let content = fs::read_to_string(&file).unwrap();
        let config = toml::from_str::<BrewConfig>(&content).unwrap();
        let bundle = config.to_bundle();
        if refresh {
            Command::new(BREW).arg("update").status().unwrap();
        }
        let mut child = Command::new(BREW);
        child.arg("bundle").arg("install").arg("--file=-");
        if upgrade {
            child.arg("--upgrade");
        }
        if purge {
            child.arg("--cleanup").arg("--zap");
        }
        let mut child = child.stdin(Stdio::piped()).spawn().unwrap();
        if let Some(stdin) = child.stdin.as_mut() {
            stdin.write_all(bundle.as_bytes()).unwrap();
        }
        child.wait().unwrap();
    }

    fn install(&self, app: &str, cask: bool, mas_app_id: Option<&i64>) {
        let mut child = if let Some(id) = mas_app_id {
            let mut c = Command::new(MAS);
            c.arg(id.to_string());
            c
        } else if cask {
            let mut c = Command::new(BREW);
            c.arg("install").arg("--cask").arg(app);
            c
        } else {
            let mut c = Command::new(BREW);
            c.arg("install").arg("--formula").arg(app);
            c
        };
        child.status().unwrap();
        let file = get_toml_config(APP, BREW);
        let content = fs::read_to_string(&file).unwrap();
        let mut doc = content.parse::<DocumentMut>().unwrap();
        if let Some(id) = mas_app_id {
            doc.entry("mas")
                .or_insert(table())
                .as_table_mut()
                .unwrap()
                .insert(app, value(*id));
        } else {
            if app.contains('/') {
                doc.entry("taps")
                    .or_insert(value(Array::new()))
                    .as_array_mut()
                    .unwrap()
                    .push(app.rsplit_once('/').unwrap().0);
            }
            doc.entry(if cask { "cask" } else { "formula" })
                .or_insert(table())
                .as_table_mut()
                .unwrap()
                .insert(app, table());
        }
        fs::write(file, doc.to_string()).unwrap();
    }
}

impl Package for FormulaConfig {
    fn profile(&self) -> &str {
        &self.profile
    }

    fn os(&self) -> &str {
        &self.os
    }

    fn arch(&self) -> &str {
        &self.arch
    }
}

impl Package for CaskConfig {
    fn profile(&self) -> &str {
        &self.profile
    }

    fn os(&self) -> &str {
        &self.os
    }

    fn arch(&self) -> &str {
        &self.arch
    }
}

impl Package for MasConfig {
    fn profile(&self) -> &str {
        &self.profile
    }

    fn os(&self) -> &str {
        &self.os
    }

    fn arch(&self) -> &str {
        &self.arch
    }
}

impl BrewConfig {
    fn to_bundle(&self) -> String {
        let mut bundle = String::new();
        for name in &self.taps {
            bundle.push_str(&format!("tap \"{}\"\n", name));
        }
        for (name, config) in &self.formulae {
            if config.should_install() {
                bundle.push_str(&format!("brew \"{}\"\n", name));
            }
        }
        for (name, config) in &self.casks {
            if config.should_install() {
                bundle.push_str(&format!("cask \"{}\"\n", name));
            }
        }
        for (name, config) in &self.mas_apps {
            if config.should_install() {
                bundle.push_str(&format!("mas \"{}\", id: {}\n", name, config.id));
            }
        }
        bundle
    }
}
