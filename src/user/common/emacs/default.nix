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
      ];
  };

  # Initialization files
  xdg.configFile = {
    "emacs/init.el".source = ./init.el; # Initialization file
    "emacs/early-init.el".source = ./early-init.el; # Early initialization file
  };
}
