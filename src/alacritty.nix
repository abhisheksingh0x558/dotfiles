{ pkgs, ... }:
let
  # Theme
  # TODO: Add option for this in upstream Home Manager
  mocha = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/catppuccin/alacritty/refs/heads/main/catppuccin-mocha.toml";
    sha256 = "sha256-/N3rwIZ0SJBiE7TiBs4pEjhzM1f2hr26WXM3ifUzzOY=";
  };
in {
  # Terminal
  programs.alacritty = {
    enable = true;

    # UI/UX
    settings = {
      import = [
        mocha # Theme
      ];
      # Font
      font.normal.family = "FiraCode Nerd Font";
      font.size = 12.0;
    };
  };
}
