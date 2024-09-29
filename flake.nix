{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # NixOS hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { nixpkgs, nixos-hardware, ... }: {
    # NixOS on AMD based Darwin machine
    nixosConfigurations.darwin-amd = nixpkgs.lib.nixosSystem {
      modules = [
        { nixpkgs.hostPlatform = "x86_64-linux"; }
        nixos-hardware.nixosModules.apple-t2 # Kernal to enable wifi, keyboard, touchpad, etc.
        {
          hardware.firmware = [
            # Firmware to enable wifi
            (nixpkgs.legacyPackages.x86_64-linux.stdenvNoCC.mkDerivation rec {
              name = "brcm-firmware";
              src = ./firmware.tar;
              unpackPhase = ''
                mkdir -p $out/lib/firmware/brcm
                tar -xf ${src} -C $out/lib/firmware/brcm
              '';
            })
          ];
        }
        ./hardware.nix # FIXME: Generate with `nixos-generate-config`
        ./nixos.nix
      ];
    };
  };
}
