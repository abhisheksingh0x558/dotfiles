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
  };

  # Initialization files
  xdg.configFile = (transpile [
    "init" # Initialization file
    "lua/lib" # Library
    "lua/option" # Options
  ]);
}
