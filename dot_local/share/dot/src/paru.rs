use crate::common::APP;
use crate::common::Package;
use crate::common::get_toml_config;
use clap::Subcommand;
use serde::Deserialize;
use std::collections::HashMap;
use std::collections::HashSet;
use std::env;
use std::fs;
use std::process::Command;
use toml_edit::DocumentMut;
use toml_edit::table;

const PARU: &str = "paru";

#[derive(Debug, Subcommand)]
pub enum ParuCommand {
    #[command(name = "sync")]
    Sync {
        #[arg(short = 'r', long = "refresh")]
        refresh: bool,
        #[arg(short = 'u', long = "upgrade")]
        upgrade: bool,
        #[arg(short = 'p', long = "purge")]
        purge: bool,
    },
    #[command(name = "install")]
    Install { app: String },
}

#[derive(Debug, Deserialize)]
struct ParuConfig {
    #[serde(default, flatten)]
    packages: HashMap<String, PackageConfig>,
}

#[derive(Debug, Deserialize)]
struct PackageConfig {
    #[serde(default)]
    profile: String,
    #[serde(default)]
    os: String,
    #[serde(default)]
    arch: String,
}

impl ParuCommand {
    pub fn execute(&self) {
        if env::consts::OS != "linux" {
            println!("Paru commands only work on Arch Linux");
            return;
        }
        match self {
            ParuCommand::Sync {
                refresh,
                upgrade,
                purge,
            } => self.sync(*refresh, *upgrade, *purge),
            ParuCommand::Install { app } => self.install(app),
        }
    }

    fn sync(&self, refresh: bool, upgrade: bool, purge: bool) {
        let file = get_toml_config(APP, PARU);
        let content = fs::read_to_string(&file).unwrap();
        let config = toml::from_str::<ParuConfig>(&content).unwrap();
        let (install, uninstall) = config.to_bundle();
        let mut child = Command::new(PARU);
        child.arg("--sync").arg("--needed").arg("--noconfirm");
        if refresh {
            child.arg("--refresh");
        }
        if upgrade {
            child.arg("--sysupgrade");
        }
        child.arg(install).status().unwrap();
        if purge {
            Command::new(PARU)
                .arg("--remove")
                .arg("--unneeded")
                .arg("--recursive")
                .arg("--nosave")
                .arg("--noconfirm")
                .arg(uninstall)
                .status()
                .unwrap();
        }
    }

    fn install(&self, app: &str) {
        Command::new(PARU)
            .arg("--sync")
            .arg("--needed")
            .arg("--noconfirm")
            .arg(app)
            .status()
            .unwrap();
        let file = get_toml_config(APP, PARU);
        let content = fs::read_to_string(&file).unwrap();
        let mut doc = content.parse::<DocumentMut>().unwrap();
        doc.entry(app).or_insert(table());
        fs::write(file, doc.to_string()).unwrap();
    }
}

impl Package for PackageConfig {
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

impl ParuConfig {
    fn to_bundle(&self) -> (String, String) {
        let output = Command::new(PARU)
            .arg("--query")
            .arg("--explicit")
            .arg("--quiet")
            .output()
            .unwrap();
        let current: HashSet<String> = String::from_utf8(output.stdout)
            .unwrap()
            .lines()
            .map(|s| s.to_string())
            .collect();
        let mut install = HashSet::new();
        let mut uninstall = HashSet::new();
        for name in current {
            let should_install = self
                .packages
                .get(&name)
                .map(|config| config.should_install())
                .unwrap_or_default();
            if should_install {
                install.insert(name);
            } else {
                uninstall.insert(name);
            }
        }
        (
            install.into_iter().collect::<Vec<_>>().join("\n"),
            uninstall.into_iter().collect::<Vec<_>>().join("\n"),
        )
    }
}
