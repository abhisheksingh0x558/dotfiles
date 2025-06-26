use crate::common::APP;
use crate::common::Package;
use crate::common::get_toml_config;
use clap::Subcommand;
use serde::Deserialize;
use serde::Serialize;
use std::collections::HashMap;
use std::fs;
use std::process::Command;
use toml_edit::DocumentMut;
use toml_edit::table;

const MISE: &str = "mise";

#[derive(Debug, Subcommand)]
pub enum MiseCommand {
    #[command(name = "sync")]
    Sync,
    #[command(name = "install")]
    Install { tool: String },
}

#[derive(Debug, Deserialize, Serialize)]
struct MiseConfig {
    #[serde(default)]
    settings: HashMap<String, toml::Value>,
    #[serde(default)]
    tools: HashMap<String, ToolConfig>,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
struct ToolConfig {
    #[serde(default = "latest")]
    version: String,
    #[serde(default, skip_serializing)]
    profile: String,
    #[serde(default, skip_serializing)]
    os: String,
    #[serde(default, skip_serializing)]
    arch: String,
    #[serde(default, flatten)]
    rest: HashMap<String, toml::Value>,
}

impl MiseCommand {
    pub fn execute(&self) {
        match self {
            MiseCommand::Sync => self.sync(),
            MiseCommand::Install { tool } => self.install(tool),
        }
    }

    fn sync(&self) {
        let file = get_toml_config(APP, MISE);
        let content = fs::read_to_string(&file).unwrap();
        let config = toml::from_str::<MiseConfig>(&content).unwrap();
        let bundle = config.to_bundle();
        let file = get_toml_config(MISE, "config");
        fs::write(file, toml::to_string_pretty(&bundle).unwrap()).unwrap();
        Command::new(MISE).arg("install").status().unwrap();
    }

    fn install(&self, tool: &str) {
        Command::new(MISE)
            .arg("use")
            .arg("--global")
            .arg(tool)
            .status()
            .unwrap();
        let file = get_toml_config(APP, MISE);
        let content = fs::read_to_string(&file).unwrap();
        let mut doc = content.parse::<DocumentMut>().unwrap();
        doc.entry("tools")
            .or_insert(table())
            .as_table_mut()
            .unwrap()
            .insert(tool, table());
        fs::write(file, doc.to_string()).unwrap();
    }
}

impl Package for ToolConfig {
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

impl MiseConfig {
    fn to_bundle(&self) -> MiseConfig {
        MiseConfig {
            settings: self.settings.clone(),
            tools: self
                .tools
                .iter()
                .filter(|(_, config)| config.should_install())
                .map(|(k, v)| (k.clone(), (*v).clone()))
                .collect(),
        }
    }
}

fn latest() -> String {
    "latest".to_string()
}
