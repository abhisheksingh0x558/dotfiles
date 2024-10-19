{ pkgs, ... }:
let
  xdgBrowsers = [
    "brave-browser.desktop" # Default browser
  ];
in {
  # Browser
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  xdg.mimeApps.defaultApplications = {
    # Default browser
    "text/html" = xdgBrowsers;
    "x-scheme-handler/http" = xdgBrowsers;
    "x-scheme-handler/https" = xdgBrowsers;
    "x-scheme-handler/about" = xdgBrowsers;
    "x-scheme-handler/unknown" = xdgBrowsers;
  };
}
