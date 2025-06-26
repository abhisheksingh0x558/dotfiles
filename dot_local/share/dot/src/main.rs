mod common;
mod mise;

use clap::Parser;
use clap::Subcommand;
use mise::MiseCommand;

#[derive(Debug, Parser)]
#[command(name = "dot")]
struct DotCommand {
    #[command(subcommand)]
    command: PackageCommand,
}

#[derive(Debug, Subcommand)]
enum PackageCommand {
    #[command(name = "mise")]
    Mise {
        #[command(subcommand)]
        command: MiseCommand,
    },
}

impl DotCommand {
    fn execute(&self) {
        self.command.execute();
    }
}

impl PackageCommand {
    fn execute(&self) {
        match self {
            PackageCommand::Mise { command } => command.execute(),
        }
    }
}

fn main() {
    DotCommand::parse().execute();
}
