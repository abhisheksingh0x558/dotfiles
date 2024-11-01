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
  ];

  # Go
  programs.go = {
    enable = true;
    # TODO: Use xdg.dataHome
    goPath = ".local/share/go"; # Path for install global modules
    # TODO: Use xdg.dataHome
    goBin = ".local/share/bin"; # Path for installing global binaries
    # Private modules
    goPrivate = [
      "github.com/watchtowerai" # Work repositories
    ];
  };
}
