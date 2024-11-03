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
  };

  outputs = inputs@{ nixpkgs, nix-darwin, ... }:
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
    };
}
