user:
	home-manager switch --flake . # Update user configuration

system:
	sudo nixos-rebuild switch --flake . # Update system configuration

sync:
	nix flake update

purge:
	nix-collect-garbage --delete-old # Garbage collect user store
	sudo nix-collect-garbage --delete-old # Garbage collect system store
	sudo /run/current-system/bin/switch-to-configuration boot # Remove old boot loader entries
