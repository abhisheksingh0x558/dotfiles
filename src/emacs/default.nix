{
  # Editor
  programs.emacs = {
    enable = true;

    extraPackages = epkgs:
      with epkgs; [
        # Key mappings
        # Vi layer
        evil
        evil-collection
        evil-commentary # Manipulate comments
        evil-surround # Manipulate surrounding pairs
        evil-exchange # Exchange operator
        evil-lion # Manipulate alignments
        # TODO: Check if this is required
        evil-snipe # Navigate with search labels
        # TODO: Replace with embark/transient/hercules
        hydra # Sticky key mappings

        # UI/UX
        catppuccin-theme # Theme
        dashboard # Dashboard
        highlight-indent-guides # Indentation guides
        vertico-posframe # UI for mini-buffer
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
      ];
  };

  # Init file
  xdg.configFile = {
    "emacs/init.el".source = ./init.el;
    "emacs/early-init.el".source = ./early-init.el;
  };
}
