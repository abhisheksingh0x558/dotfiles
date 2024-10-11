{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    inputs.emacs-overlay.overlays.default # Emacs nightly overlay

    (_: _: {
      # Wezterm nightly overlay
      wezterm = inputs.wezterm.packages.${pkgs.system}.default;

      # Emacs nightly overlay
      emacs = inputs.emacs-overlay.packages.${pkgs.system}.emacs-unstable;
    })
  ];
}
