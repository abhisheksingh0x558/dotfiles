{ pkgs, ... }:
let cfg = import ../cfg/config.nix;
in {
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.default.user.username;
  home.homeDirectory = /home + "/${cfg.default.user.username}";

  imports = [
    ./nushell # Shell
    ./brave.nix # Browser
  ];

  # MIME applications
  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    # Fonts
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Prompt
  programs.starship.enable = true;

  # TUIs
  programs.zoxide.enable = true; # Change directory
}
