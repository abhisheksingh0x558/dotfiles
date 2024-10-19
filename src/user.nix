let cfg = import ../cfg/config.nix;
in {
  imports = [
    ./nushell # Shell
    ./firefox.nix # Browser
    ./brave.nix # Browser
  ];

  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.default.user.username;
  home.homeDirectory = /home + "/${cfg.default.user.username}";

  # MIME applications
  xdg.mimeApps.enable = true;
}
