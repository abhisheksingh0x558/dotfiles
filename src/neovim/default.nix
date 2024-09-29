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
in {
  # Editor
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Default editor
  };

  # Init file
  xdg.configFile."nvim/${initFile}".source = builtins.toString initPath
    + "/${initFile}";
}
