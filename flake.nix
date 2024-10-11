{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # NixOS hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { nixpkgs, nixos-hardware, ... }: {
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
  };
}
