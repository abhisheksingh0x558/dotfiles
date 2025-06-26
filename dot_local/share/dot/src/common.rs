use std::env;
use std::fs::OpenOptions;
use std::path::PathBuf;

pub const APP: &str = "dot";

pub fn get_toml_config(app: &str, name: &str) -> PathBuf {
    let path = PathBuf::from(env::var("HOME").unwrap())
        .join(".config")
        .join(app)
        .join(format!("{}.toml", name));
    OpenOptions::new()
        .create(true)
        .append(true)
        .open(&path)
        .unwrap();
    path
}

pub trait Package {
    fn profile(&self) -> &str;
    fn os(&self) -> &str;
    fn arch(&self) -> &str;

    fn should_install(&self) -> bool {
        let profile = env::var("DOT_PROFILE").unwrap_or_default();
        let os = env::consts::OS;
        let arch = env::consts::ARCH;
        (self.profile() == profile || self.profile().is_empty() || profile.is_empty())
            && (self.os() == os || self.os().is_empty())
            && (self.arch() == arch || self.arch().is_empty())
    }
}
