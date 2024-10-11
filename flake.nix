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
  };

  outputs = { nixpkgs, nixos-hardware, nix-darwin, home-manager, ... }: {
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
      modules = [ ./src/user/nixos ];
    };
  };
}
