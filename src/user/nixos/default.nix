{ pkgs, ... }:
let cfg = import ../../../cfg/config.nix;
in {
  imports = [ ../common ];

  # Default user
  home.homeDirectory = /home + "/${cfg.user.default.username}";

  # XDG MIME applications
  xdg.mimeApps.enable = true;

  # Browser
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };

  # Browser
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  # Terminal
  programs.alacritty.enable = true;

  # Terminal
  programs.wezterm.enable = true;

  home.packages = with pkgs;
    [
      # GUIs
      bitwarden-desktop # Password manager
    ];
}
