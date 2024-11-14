let cfg = import ../../../cfg/config.nix;
in {
  imports = [
    ./overlay.nix # Overlays
    ./nushell # Shell
    ./zsh # Shell
  ];

  # Home Manager
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.user.default.username;
}
