{
  nix.settings = rec {
    # Binary cache
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
}
