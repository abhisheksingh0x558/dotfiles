{ pkgs, ... }:
let cfg = import ../cfg/config.nix;
in {
  imports = [
    ./nushell # Shell
    ./firefox.nix # Browser
    ./brave.nix # Browser
  ];

  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.default.user.username;
  home.homeDirectory = /home + "/${cfg.default.user.username}";

  # MIME applications
  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    # Fonts
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Shell prompt
  programs.starship.enable = true;

  # Shell autocompletion
  programs.carapace.enable = true;
  programs.thefuck.enable = true; # Autocorrection

  # TUIs
  programs.zoxide.enable = true; # Change directory

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
