{ lib, ... }: {
  # Editor
  programs.emacs = {
    enable = true;

    extraPackages = epkgs:
      with epkgs;
      [
        # Code style
        (lib.warn "editorconfig is merged to upstream in emacs 30" editorconfig)
      ];
  };

  xdg.configFile."emacs/init.el".source = ./init.el; # Init file
}
