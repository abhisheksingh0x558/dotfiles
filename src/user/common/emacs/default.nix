{
  # Editor
  programs.emacs = {
    enable = true;

    extraPackages = epkgs:
      with epkgs; [
        # Keymaps
        # Vi layer
        evil
        evil-collection
        evil-commentary # Manipulate comments
        evil-surround # Manipulate surrounding pairs
        evil-exchange # Exchange operator
        evil-lion # Manipulate alignments
        # TODO: Check if this is required
        evil-snipe # Navigate with search labels
        # TODO: Replace with newer packages by the same author
        general
        # TODO: Replace with embark/transient/hercules
        hydra # Sticky keymaps

        # UI/UX
        doom-themes # Theme
        nerd-icons # Icons
        doom-modeline # Modeline
        dashboard # Dashboard
        highlight-indent-guides # Indentation guides
        # TODO: Check if this is possilbe via treesitter
        hl-todo # Highlight todo comments
        rainbow-delimiters # Highlight brackets

        # Fuzzy finder
        vertico # TODO: document this here and in init.el
        consult # TODO: document this here and in init.el
        marginalia # TODO: document this here and in init.el
        # TODO: Check if prescient is better
        orderless # TODO: document this here and in init.el

        # Autocompletion
        corfu # TODO: document this here and in init.el
        cape # TODO: document this here and in init.el

        # VCS integration
        magit # Git client

        # Treesitter integration
        treesit-grammars.with-all-grammars # Language grammars
        tree-sitter-langs # Language queries

        # Formatter
        apheleia

        # Nix support
        # TODO: Merge this in upstream emacs and remove from here
        nix-mode
        nix-ts-mode
      ];
  };

  # Initialization files
  xdg.configFile = {
    "emacs/init.el".source = ./init.el; # Initialization file
    "emacs/early-init.el".source = ./early-init.el; # Early initialization file
  };
}
