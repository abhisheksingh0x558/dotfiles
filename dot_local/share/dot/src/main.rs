mod brew;
mod common;
mod mise;
mod paru;

use brew::BrewCommand;
use clap::Parser;
use clap::Subcommand;
use mise::MiseCommand;
use paru::ParuCommand;

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
    #[command(name = "paru")]
    Paru {
        #[command(subcommand)]
        command: ParuCommand,
    },
    #[command(name = "brew")]
    Brew {
        #[command(subcommand)]
        command: BrewCommand,
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
            PackageCommand::Paru { command } => command.execute(),
            PackageCommand::Brew { command } => command.execute(),
        }
    }
}

fn main() {
    DotCommand::parse().execute();
}
