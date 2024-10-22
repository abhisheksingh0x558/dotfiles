{ pkgs, ... }: {
  # Browser
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
