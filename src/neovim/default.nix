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
    ];
  };

  # Init file
  xdg.configFile."nvim/${initFile}".source = builtins.toString initPath
    + "/${initFile}";
}
