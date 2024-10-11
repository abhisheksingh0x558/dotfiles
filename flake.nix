{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.05";

    # NixOS hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Nix Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake utils
    # TODO: Remove this overlay
    flake-utils.url = "github:numtide/flake-utils";

    # Rust overlay
    # TODO: Remove this overlay
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Wezterm nightly overlay
    # TODO: Remove this overlay
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.rust-overlay.follows = "rust-overlay";
    };

    # Emacs nightly overlay
    # TODO: Remove this overlay
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }:
    let cfg = import ./cfg/config.nix;
    in {
      # NixOS
      nixosConfigurations.${cfg.hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./src/system/nixos ];
      };

      # MacOS
      darwinConfigurations.${cfg.hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./src/system/macos ];
      };

      # NixOS Home Mananger
      homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./src/user/nixos ];
      };

      # MacOS Home Mananger
      homeConfigurations.macos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./src/user/macos ];
      };
    };
}
