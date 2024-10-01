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

      # UI/UX
      nightfox-nvim # Theme
      nvim-web-devicons # Icons
      tabby-nvim # Tabline
      feline-nvim # Statusline
      dashboard-nvim # Dashboard
      which-key-nvim # Helper popup for keys
      indent-blankline-nvim # Indentation guides
      nui-nvim # UI component library
      noice-nvim # UI for messages, cmdline, and popupmenu
      trouble-nvim # UI for diagnostics, references, telescope results, quickfix and location list
      nvim-notify # UI for notifications
      dressing-nvim # Improve UI defaults
      # TODO: Check if this is possilbe via treesitter
      todo-comments-nvim # Highlight todo comments
      rainbow-delimiters-nvim # Highlight brackets
      vim-illuminate # Highlight word under cursor
      focus-nvim # Window layout manager
      edgy-nvim # Window layout manager
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
