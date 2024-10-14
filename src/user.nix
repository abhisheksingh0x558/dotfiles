{ pkgs, ... }:
let cfg = import ../cfg/config.nix;
in {
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.default.user.username;
  home.homeDirectory = /home + "/${cfg.default.user.username}";

  imports = [
    ./nushell # Shell
    ./brave.nix # Browser
    ./editorconfig.nix # Code style
    ./git.nix # VCS
    ./alacritty.nix # Terminal
    ./emacs # Editor
    ./neovim # Editor
    ./zellij.nix # Terminal multiplexer
    ./hyprland.nix # Window manager
  ];

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
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Prompt
  programs.starship.enable = true;

  # TUIs
  programs.zoxide.enable = true; # Change directory

  # Go
  programs.go = {
    enable = true;
    goPath = ".local/share/go"; # Path for install global modules
    goBin = ".local/share/bin"; # Path for installing global binaries
    goPrivate = [ "github.com/watchtowerai" ]; # Private modules
  };
}
