let
  xdgBrowsers = [
    "brave-browser.desktop" # Default browser
  ];
in {
  # TODO: Check if this is required in common module (for macos)
  xdg.mimeApps.defaultApplications = {
    # Default browser
    "text/html" = xdgBrowsers;
    "x-scheme-handler/http" = xdgBrowsers;
    "x-scheme-handler/https" = xdgBrowsers;
    "x-scheme-handler/about" = xdgBrowsers;
    "x-scheme-handler/unknown" = xdgBrowsers;
  };
}