{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    (_: _: {
      # Wezterm nightly overlay
      wezterm = inputs.wezterm.packages.${pkgs.system}.default;
    })
  ];
}
