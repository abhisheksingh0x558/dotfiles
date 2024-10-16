# TODO: Refactor commands to have better names and allow running from any folder and add aliases as well
nixos-mbp:
	home-manager switch --flake .#nixos-mbp # Update NixOS user configuration

macos-mbp:
	home-manager switch --flake .#macos-mbp # Update Macos user configuration

macos-mbpm1:
	home-manager switch --flake .#macos-mbpm1 # Update Macos user configuration

system-nixos-mbp:
	nixos-rebuild switch --flake .#mbp # Update NixOS system configuration

system-macos-mbp:
	darwin-rebuild switch --flake .#mbp # Update MacOS system configuration

system-macos-mbpm1:
	darwin-rebuild switch --flake .#mbpm1 # Update MacOS system configuration

sync:
	nix flake update

purge:
	# TODO: Fix this for MacOS and remove sudo for NixOS
	nix-collect-garbage --delete-old # Garbage collect user store
	sudo nix-collect-garbage --delete-old # Garbage collect system store
	sudo /run/current-system/bin/switch-to-configuration boot # Remove old boot loader entries
