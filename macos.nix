{ pkgs, ... }: {
  # Nix Darwin version
  # WARNING: Do not change this without referring to release notes for Nix Darwin
  system.stateVersion = 5;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Homebrew
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "zap"; # Uninstall stale applications

  environment.systemPackages = with pkgs; [
    nushell # Shell
    zsh # Shell
  ];

  # Permissible shells
  environment.shells = with pkgs; [ nushell zsh ];
}
