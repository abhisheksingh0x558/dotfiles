{
  inputs = {
    # Sync Home Manager nixpkgs version with NixOS nixpkgs version
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Wezterm nightly overlay
    # TODO: Remove this overlay
    wezterm.url = "github:wez/wezterm?dir=nix";

    # Emacs nightly overlay
    # TODO: Remove this overlay
    emacs-overlay.url = "github:nix-community/emacs-overlay";

    # Neovim nightly overlay
    # TODO: Remove this overlay
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # TODO: Remove this oncoe Cosmic DE is merged to nixpkgs upstream
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }@inputs:
    let
      cfg = import ./cfg/config.nix;
      system = "x86_64-linux";

      # Binary cache
      substituters = {
        nix.settings = rec {
          substituters = [
            "https://cache.soopy.moe" # Macbook kernel
            "https://nix-community.cachix.org" # Nix community
            "https://cosmic.cachix.org/" # Cosmic
          ];
          trusted-substituters = substituters;
          trusted-public-keys = [
            "cache.soopy.moe-1:0RZVsQeR+GOh0VQI9rvnHz55nVXkFardDqfm4+afjPo="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
          ];
        };
      };

      firmware = { pkgs, ... }: {
        hardware.firmware = [
          # NOTE: Firmware for macbook to enable wifi
          (pkgs.stdenvNoCC.mkDerivation rec {
            name = "brcm-firmware";
            src = ./res/firmware.tar;
            unpackPhase = ''
              mkdir -p $out/lib/firmware/brcm
              tar -xf ${src} -C $out/lib/firmware/brcm
            '';
          })
        ];
      };

      overlays = { pkgs, ... }: {
        nixpkgs.overlays = [
          inputs.emacs-overlay.overlays.default # Emacs nightly overlay
          inputs.neovim-nightly-overlay.overlays.default # Neovim nightly overlay
          # TODO: Handle these unused args
          (final: prev: {
            wezterm =
              inputs.wezterm.packages.${pkgs.system}.default; # Wezterm nightly overlay
            emacs =
              inputs.emacs-overlay.packages.${pkgs.system}.emacs-unstable; # Emacs nightly overlay
            neovim-unwrapped =
              inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim; # Neovim nightly overlay
          })
        ];
      };
    in {
      # NixOS
      nixosConfigurations.${cfg.hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          substituters
          ./src/system.nix
          ./gen/hardware.nix # FIXME: Generate with `nixos-generate-config`
          nixos-hardware.nixosModules.apple-t2 # NOTE: Kernal for macbook to enable wifi, keyboard, touchpad, etc.
          firmware
          inputs.nixos-cosmic.nixosModules.default # Cosmic nightly overlay
        ];
      };

      # Home Mananger
      homeConfigurations.${cfg.default.user.username} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ overlays ./src/user.nix ];
        };
    };
}
