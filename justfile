os_type := `uname -s`
os := if os_type == "Linux" {
	"nixos"
} else if os_type == "Darwin" {
	"macos"
} else {
	error("invalid os")
}

arch_type := `uname -m`
arch := if arch_type == "x86_64" {
	"amd"
} else if arch_type == "arm64" {
	"arm"
} else {
	error("invalid arch")
}

sync:
	nix flake update # Upgrade packages

link:
	chezmoi apply # Link dotfiles

user:
	home-manager switch --flake .#{{os}}-{{arch}} # Update user configuration

system-nixos-darwin:
	nixos-rebuild switch --flake .#darwin-{{arch}} # Update system configuration for NixOS on Darwin machine

system-macos-darwin:
	darwin-rebuild switch --flake .#darwin-{{arch}} # Update system configuration for MacOS on Darwin machine

purge:
	nix-collect-garbage --delete-old # Garbage collect nix store

reset:
	/run/current-system/bin/switch-to-configuration boot # Remove old boot loader entries for NixOS
