{
  outputs = { nixpkgs, nixos-hardware, ... }:
    let
      cfg = import ./cfg/config.nix;
      system = "x86_64-linux";

      # Binary cache
      substituters = {
        nix.settings = rec {
          substituters = [
            "https://cache.soopy.moe" # Macbook kernel
            "https://nix-community.cachix.org" # Nix community
          ];
          trusted-substituters = substituters;
          trusted-public-keys = [
            "cache.soopy.moe-1:0RZVsQeR+GOh0VQI9rvnHz55nVXkFardDqfm4+afjPo="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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
        ];
      };
    };
}
