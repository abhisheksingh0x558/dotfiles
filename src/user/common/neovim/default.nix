{ pkgs, ... }:
let
  # Transpile fennel to lua
  transpile = files:
    builtins.foldl' (files: file:
      let
        fileName = builtins.baseNameOf file;
        filePath = pkgs.stdenvNoCC.mkDerivation rec {
          name = "neovim";
          src = ./${fileName} + ".fnl";
          dontUnpack = true;
          installPhase = ''
            mkdir -p $out
            fennel --compile ${src} > $out/${fileName}.lua
          '';
          nativeBuildInputs = [ pkgs.luajitPackages.fennel ];
        };
      in files // {
        "nvim/${file}.lua".source = builtins.toString filePath
          + "/${fileName}.lua";
      }) { } files;
in {
  # Editor
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Default editor

    plugins = with pkgs.vimPlugins; [
      # Keymaps
      unimpaired-nvim # Pairs of bracket keymaps
      comment-nvim # Manipulate comments
      nvim-surround # Manipulate surrounding pairs
      substitute-nvim # Exchange operator
      text-case-nvim # Manipulate text cases
      align-nvim # Manipulate alignments
      dial-nvim # Increment and decrement operator
      treesj # Split and join operator
      nvim-gomove # Move and duplicate block operator
      flash-nvim # Navigate with search labels
      grug-far-nvim # Find and replace
      nvim-various-textobjs # Text objects
      neogen # Annotation generator
      other-nvim # Alternative files
      scretch-nvim # Scratch files
      hydra-nvim # Sticky keymaps
    ];
  };

  # Initialization files
  xdg.configFile = (transpile [
    "init" # Initialization file
    "lua/lib" # Library
    "lua/option" # Options
    "lua/keymap" # Keymaps
    "lua/plugin/plugin" # Plugins
  ]);
}
