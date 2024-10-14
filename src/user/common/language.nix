{ pkgs, ... }: {
  home.packages = with pkgs; [
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

    # Rust
    # TODO: Install language server
    # TODO: Install formatter
    # TODO: Install linter
    rustc
    cargo # Package manager

    # Kotlin
    kotlin
    kotlin-language-server # Language server
    ktfmt # Formatter
    ktlint # Linter
  ];

  # Go
  programs.go = {
    enable = true;
    goPath = ".local/share/go"; # Path for install global modules
    goBin = ".local/share/bin"; # Path for installing global binaries
    goPrivate = [ "github.com/watchtowerai" ]; # Private modules
  };
}
