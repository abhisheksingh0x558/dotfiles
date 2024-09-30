{ pkgs, ... }:
let
  # Init file
  initFile = "init.lua";
  initPath = pkgs.stdenvNoCC.mkDerivation rec {
    name = "neovim";
    src = ./init.fnl;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      fennel --compile ${src} > $out/${initFile}
    '';
    nativeBuildInputs = [ pkgs.luajitPackages.fennel ];
  };

  # Pairs of bracket key mappings
  # TODO: Merge this to upstream nixpkgs and remove from here
  unimpaired-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "unimpaired.nvim";
    version = "2024-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "tummetott";
      repo = "unimpaired.nvim";
      rev = "8e504ba95dd10a687f4e4dacd5e19db221b88534";
      sha256 = "sha256-CNU4cigMjbvOdUzUXze9ZDmTZRuYtj4dCuuLVZkMTQg=";
    };
    meta.homepage = "https://github.com/tummetott/unimpaired.nvim/";
  };

  # Manipulate alignments
  # TODO: Merge this to upstream nixpkgs and remove from here
  align-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "align.nvim";
    version = "2024-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "Vonr";
      repo = "align.nvim";
      rev = "12ed24b34df81d57e777fea5a535611bab10a620";
      sha256 = "sha256-z8+lEs8bQS4Gz3cgQQ5Cb3oW58Et7it/tAxUtE3cLc4=";
    };
    meta.homepage = "https://github.com/Vonr/align.nvim/";
  };

  # Move and duplicate block operator
  # TODO: Merge this to upstream nixpkgs and remove from here
  nvim-gomove = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-gomove";
    version = "2024-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "booperlv";
      repo = "nvim-gomove";
      rev = "2b44ae7ac0804f4e3959228122f7c85bef1964e3";
      sha256 = "sha256-9YLJm/L13gTktb6VIkz2W/60cothFtF7feiKd26R5lo=";
    };
    meta.homepage = "https://github.com/booperlv/nvim-gomove/";
  };

  # Scratch files
  # TODO: Merge this to upstream nixpkgs and remove from here
  scretch-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "scretch.nvim";
    version = "2024-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "0xJohnnyboy";
      repo = "scretch.nvim";
      rev = "0b2fbd0ed285f74baab7396a4a08c7bb7a3653c1";
      sha256 = "sha256-BqCVe7dY6WNJZS2XTNcnvB9d+HoM0wUItmmVskEaVHQ=";
    };
    meta.homepage = "https://github.com/0xJohnnyboy/scretch.nvim/";
  };

  # Window manager
  # TODO: Merge this to upstream nixpkgs and remove from here
  focus-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "focus.nvim";
    version = "2024-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-focus";
      repo = "focus.nvim";
      rev = "3841a38df972534567e85840d7ead20d3a26faa6";
      sha256 = "sha256-mgHk4u0ab2uSUNE+7DU22IO/xS5uop9iATfFRk6l6hs=";
    };
    meta.homepage = "https://github.com/nvim-focus/focus.nvim/";
  };
in {
  # Editor
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Default editor

    plugins = with pkgs.vimPlugins; [
      # Key mappings
      unimpaired-nvim # Pairs of bracket key mappings
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
      hydra-nvim # Sticky key mappings

      # UI/UX
      catppuccin-nvim # Theme
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
      # TODO: Check if this is require given nivm-notify
      fidget-nvim # UI for progress messages
      dressing-nvim # Improve UI defaults
      todo-comments-nvim # Highlight todo comments # TODO: Check if this is possilbe via treesitter
      rainbow-delimiters-nvim # Highlight brackets
      vim-illuminate # Highlight word under cursor
      # TODO: Enable this
      # precognition.nvim # Virtual text to discover motions
      focus-nvim # Window layout manager
      edgy-nvim # Window layout manager

      # Fuzzy finder
      telescope-nvim
      telescope-fzf-native-nvim # Fzf file sorter
    ];
  };

  xdg.configFile."nvim/init.lua".source = builtins.toString initPath
    + "/${initFile}"; # Init file
}
