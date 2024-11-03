{
  imports = [ ../common ];

  # Nix Darwin version
  # WARNING: Do not change this without referring to release notes for Nix Darwin
  system.stateVersion = 5;

  # System architecture
  nixpkgs.hostPlatform = "x86_64-darwin";

  # Nix daemon
  services.nix-daemon.enable = true;
}
