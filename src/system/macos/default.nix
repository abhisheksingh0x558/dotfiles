{
  imports = [ ../common ];

  # Nix Darwin version
  # WARNING: Do not change this without referring to release notes for Nix Darwin
  system.stateVersion = 5;

  # Nix daemon
  services.nix-daemon.enable = true;
}
