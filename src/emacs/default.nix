{ lib, ... }: {
  # Editor
  programs.emacs = {
    enable = true;

    extraPackages = epkgs:
      with epkgs; [
        # Code style
        (lib.warn "editorconfig is merged to upstream in emacs 30" editorconfig)

        # Key mappings
        # Vi layer
        evil
        evil-collection

        # UI/UX
        catppuccin-theme # Theme
        (lib.warn "which-key is merged to upstream in emacs 30" which-key)
        vertico-posframe # UI for mini-buffer

        # Fuzzy finder
        vertico # TODO: document this here and in init.el
        consult # TODO: document this here and in init.el
        marginalia # TODO: document this here and in init.el
        orderless # TODO: document this here and in init.el

        # Autocompletion
        corfu # TODO: document this here and in init.el
        cape # TODO: document this here and in init.el

        # VCS integration
        magit # Git client

        # Treesitter integration
        tree-sitter-langs # Language queries
        treesit-grammars.with-all-grammars # Language grammars

        # Formatter
        apheleia

        # Nix support
        # TODO: Merge this in upstream emacs and remove from here
        nix-ts-mode
      ];
  };

  xdg.configFile = {
    "emacs/init.el".source = ./init.el; # Init file
    "emacs/early-init.el".source = ./early-init.el; # Early init file
  };
}
