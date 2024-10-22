{ pkgs, ... }:
let cfg = import ../../../cfg/config.nix;
in {
  imports = [ ../common ];

  # Default user
  home.homeDirectory = /home + "/${cfg.user.default.username}";

  # Browser
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
