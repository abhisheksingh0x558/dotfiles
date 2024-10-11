{
  # Sync Home Manager nixpkgs version with NixOS nixpkgs version
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }:
    let
      cfg = import ./cfg/config.nix;
      system = "x86_64-linux";
      firmware = { pkgs, ... }: {
        # NOTE: Firmware for macbook to enable wifi
        hardware.firmware = [
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
          ./src/system.nix
          ./gen/hardware.nix # FIXME: Generate with `nixos-generate-config`
          nixos-hardware.nixosModules.apple-t2 # NOTE: Kernal for macbook to enable wifi, keyboard, touchpad, etc.
          firmware
        ];
      };

      # Home Mananger
      homeConfigurations.${cfg.default.user.username} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./src/user.nix ];
        };
    };
}
