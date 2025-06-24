use clap::Parser;
use clap::Subcommand;

#[derive(Debug, Parser)]
#[command(name = "dot")]
struct DotCommand {
    #[command(subcommand)]
    command: PackageCommand,
}

#[derive(Debug, Subcommand)]
enum PackageCommand {}

impl DotCommand {
    fn execute(&self) {
        self.command.execute();
    }
}

impl PackageCommand {
    fn execute(&self) {}
}

fn main() {
    DotCommand::parse().execute();
}
