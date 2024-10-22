{ pkgs, ... }:
let cfg = import ../../../cfg/config.nix;
in {
  imports = [
    ./overlay.nix # Overlays
    ./nushell # Shell
    ./zsh # Shell
    ./firefox.nix # Browser
    ./brave.nix # Browser
    ./git.nix # VCS
    ./alacritty.nix # Terminal
    ./wezterm # Terminal
  ];

  # Home Manager
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.user.default.username;

  # Shell prompt
  programs.starship.enable = true;

  # Shell autocompletion
  programs.carapace.enable = true;
  programs.thefuck.enable = true; # Autocorrection

  # TUIs
  programs.zoxide.enable = true; # Change directory

  # Fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    font-awesome
    nerd-fonts.fira-code
  ];

  # Code style
  editorconfig = {
    enable = true;

    settings = {
      # All files
      "*" = {
        charset = "utf-8"; # File character encoding
        end_of_line = "lf"; # Line ending file format
        indent_size = "tab"; # Mimic tab size
        indent_style = "tab"; # Indent with tabs
        insert_final_newline = true; # Insert newline at end of file
        max_line_length = 120; # Maximum length of line
        tab_width = 2; # Tab size
        trim_trailing_whitespace = true; # Remove whitespaces at end of line
      };
    };
  };
}
