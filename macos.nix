{
  # Nix Darwin version
  # WARNING: Do not change this without referring to release notes for Nix Darwin
  system.stateVersion = 5;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Nix daemon
  services.nix-daemon.enable = true;

  # Homebrew
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "zap"; # Uninstall stale applications
}
