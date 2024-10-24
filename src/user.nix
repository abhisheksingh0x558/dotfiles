{ pkgs, ... }:
let cfg = import ../cfg/config.nix;
in {
  imports = [
    ./nushell # Shell
    ./firefox.nix # Browser
    ./brave.nix # Browser
    ./git.nix # VCS
    ./alacritty.nix # Terminal
    ./wezterm # Terminal
    ./emacs # Editor
    ./neovim # Editor
    ./zellij.nix # Terminal multiplexer
    # TODO: Think of a better structure
    ./hyprland/user.nix # Window manager
    ../res/resource.nix # Resources
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

    # CLIs
    gnumake # Build system
    eza # List files
    bat # View files
    fd # Find files
    ripgrep # Search files
    scc # Code counter
    just # Command runner

    # TUIs
    fzf # Fuzzy finder
    lazygit # Git client

    # GUIs
    bitwarden-desktop # Password manager

    # Fennel
    # TODO: Install linter
    luajitPackages.fennel
    fennel-ls # Language server
    fnlfmt # Formatter

    # Nix
    # TODO: Install language
    nil # Language server
    nixfmt # Formatter
    deadnix # Linter

    # Nu
    # TODO: Install language
    # TODO: Install language server
    # TODO: Install linter
    nufmt # Formatter

    # Zig
    # TODO: Install language server
    # TODO: Install formatter
    # TODO: Install linter
    zig

    # Go
    gopls # Language server
    gofumpt # Formatter
    go-tools # Linter

    # Kotlin
    kotlin
    kotlin-language-server # Language server
    ktfmt # Formatter
    ktlint # Linter

    # Proto
    # TODO: Install language server
    # TODO: Install linter
    protobuf
    buf # Formatter

    # Sql
    # TODO: Install language
    # TODO: Install language server
    # TODO: Install formatter
    # TODO: Install linter

    # Clipboard manager
    # TODO: Check if this is required and check the default clipboard tool install with hyprland
    wl-clipboard
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

  # Go
  programs.go = {
    enable = true;
    goPath = ".local/share/go"; # Path for install global modules
    goBin = ".local/share/bin"; # Path for installing global binaries
    goPrivate = [ "github.com/watchtowerai" ]; # Private modules
  };

  # Cursor theme
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Mauve";
    package = pkgs.catppuccin-cursors.mochaMauve;
  };
}
