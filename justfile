# TODO: Refactor commands to have better names and allow running from any folder and add aliases as well
nixos:
	home-manager switch --flake .#nixos # Update NixOS user configuration

macos:
	home-manager switch --flake .#macos # Update Macos user configuration

nixos-system:
	nixos-rebuild boot --flake .#macbookpro # Update NixOS system configuration

macos-system:
	darwin-rebuild switch --flake .#macbookpro # Update MacOS system configuration

sync:
	nix flake update

purge:
	# TODO: Fix this for MacOS and remove sudo for NixOS
	nix-collect-garbage --delete-old # Garbage collect user store
	sudo nix-collect-garbage --delete-old # Garbage collect system store
	sudo /run/current-system/bin/switch-to-configuration boot # Remove old boot loader entries
