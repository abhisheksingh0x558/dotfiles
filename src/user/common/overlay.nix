{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    inputs.emacs-overlay.overlays.default # Emacs nightly overlay

    inputs.neovim-nightly-overlay.overlays.default # Neovim nightly overlay

    (_: _: {
      # Wezterm nightly overlay
      wezterm = inputs.wezterm.packages.${pkgs.system}.default;

      # Emacs nightly overlay
      emacs = inputs.emacs-overlay.packages.${pkgs.system}.emacs-unstable;

      # Neovim nightly overlay
      neovim-unwrapped =
        inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    })
  ];
}
