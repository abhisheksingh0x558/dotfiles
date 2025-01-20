{ pkgs, ... }: {
  # Home Manager
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = "abhisheksingh";
  home.homeDirectory = if pkgs.stdenvNoCC.isLinux then
    /home/abhisheksingh
  else
    /Users/abhisheksingh;

  home.packages = with pkgs;
    [
      # Dotfile manager
      chezmoi

      # CLIs
      git # Version control system
      zoxide # Change directory
      eza # List files
      bat # View files
      fd # Find files
      ripgrep # Search files
      difftastic # Compare files
      sd # Search and replace files
      choose # Extract text from files
      scc # Code counter
      just # Command runner
      ouch # Compressor
      watchexec # File watcher
      gnumake # Build system
      devenv # Developer environment manager

      # TUIs
      fzf # Fuzzy finder
      lazygit # Git client
      zellij # Terminal multiplexer
      neovim # Editor

      # GUIs
      emacs # Editor

      # Key manager
      keychain

      # Shell utilities
      starship # Prompt
      carapace # Autocompletion
      thefuck # Autocorrection

      # Nix
      nil # Language server
      deadnix # Linter
      nixfmt # Formatter

      # Lua
      lua-language-server # Language server
      luajitPackages.luacheck # Linter # TODO: Check if this is the correct version
      stylua # Formatter

      # Haskell
      ghc
      stack # Package manager
      haskell-language-server # Language server
      hlint # Linter
      haskellPackages.fourmolu # Formatter
    ] ++ (if pkgs.stdenvNoCC.isLinux then
      (with pkgs; [
        # GUIs
        firefox-devedition # Browser
        brave # Browser
        alacritty # Terminal
        wezterm # Terminal
        bitwarden-desktop # Password manager
      ])
    else
      [ ]);
}
