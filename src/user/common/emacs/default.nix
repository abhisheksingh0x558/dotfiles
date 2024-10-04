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
        # TODO: Replace with embark/transient/hercules
        hydra # Sticky keymaps
      ];
  };

  # Initialization files
  xdg.configFile = {
    "emacs/init.el".source = ./init.el; # Initialization file
    "emacs/early-init.el".source = ./early-init.el; # Early initialization file
  };
}
