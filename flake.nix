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

    # Flake parts
    # TODO: Remove this overlay
    flake-parts.url = "github:hercules-ci/flake-parts";

    # # Flake compat
    # # TODO: Remove this overlay
    # flake-compat.url = "github:edolstra/flake-compat";
    #
    # # Git hooks
    # # TODO: Remove this overlay
    # git-hooks = {
    #   url = "github:cachix/git-hooks.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    #   inputs.flake-compat.follows = "flake-compat";
    # };
    #
    # # Hercules CI effects
    # # TODO: Remove this overlay
    # hercules-ci-effects = {
    #   url = "github:hercules-ci/hercules-ci-effects";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-parts.follows = "flake-parts";
    # };

    # Wezterm nightly overlay
    # TODO: Remove this overlay
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.rust-overlay.follows = "rust-overlay";
    };

    # # Emacs nightly overlay
    # # TODO: Remove this overlay
    # emacs-overlay = {
    #   url = "github:nix-community/emacs-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    # };
    #
    # # Neovim nightly overlay
    # # TODO: Remove this overlay
    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-parts.follows = "flake-parts";
    #   inputs.flake-compat.follows = "flake-compat";
    #   inputs.git-hooks.follows = "flake-compat";
    #   inputs.hercules-ci-effects.follows = "hercules-ci-effects";
    # };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, wezterm, ... }: {
    # NixOS on MacBook Pro
    nixosConfigurations.mbp = nixpkgs.lib.nixosSystem {
      modules =
        [ { nixpkgs.hostPlatform = "x86_64-linux"; } ./src/system/nixos ];
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
    homeConfigurations.macos-mbpm1 = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      extraSpecialArgs = { inherit wezterm; };
      modules = [ ./src/user/macos ];
    };
  };
}
