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

    extensions = [
      { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } # Theme
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ad blocker
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Password manager
    ];
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
