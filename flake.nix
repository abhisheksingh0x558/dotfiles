{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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
  };

  outputs =
    { nixpkgs, nixos-hardware, nix-darwin, home-manager, wezterm, ... }: {
      # NixOS on MacBook Pro
      nixosConfigurations.mbp = nixpkgs.lib.nixosSystem {
        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          nixos-hardware.nixosModules.apple-t2 # NOTE: Kernal for macbook to enable wifi, keyboard, touchpad, etc.
          ./src/system/nixos/firmware.nix # Firmware
          ./gen/hardware.nix # FIXME: Generate with `nixos-generate-config`
          ./src/system/nixos
        ];
      };

      # MacOS on MacBook Pro
      darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
        modules =
          [ { nixpkgs.hostPlatform = "x86_64-darwin"; } ./src/system/macos ];
      };

      # MacOS on MacBook Pro M1
      darwinConfigurations.mbpm1 = nix-darwin.lib.darwinSystem {
        modules =
          [ { nixpkgs.hostPlatform = "aarch64-darwin"; } ./src/system/macos ];
      };

      # Home Mananger on NixOS on MacBook Pro
      homeConfigurations.nixos-mbp = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit wezterm; };
        modules = [ ./src/user/nixos ];
      };

      # Home Mananger on MacOS on MacBook Pro
      homeConfigurations.macos-mbp = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        extraSpecialArgs = { inherit wezterm; };
        modules = [ ./src/user/macos ];
      };

      # Home Mananger on MacOS on MacBook Pro
      homeConfigurations.macos-mbpm1 =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          extraSpecialArgs = { inherit wezterm; };
          modules = [ ./src/user/macos ];
        };
    };
}
