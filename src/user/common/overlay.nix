{ wezterm, pkgs, ... }: {
  nixpkgs.overlays = [
    (_: _: {
      # Wezterm nightly overlay
      wezterm = wezterm.packages.${pkgs.system}.default;
    })
  ];
}
