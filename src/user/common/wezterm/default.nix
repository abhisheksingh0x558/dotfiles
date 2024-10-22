{ pkgs, ... }:
let
  # Initialization file
  initFile = "wezterm.lua";
  initPath = pkgs.stdenvNoCC.mkDerivation rec {
    name = "wezterm";
    src = ./wezterm.fnl;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      fennel --compile ${src} > $out/${initFile}
    '';
    nativeBuildInputs = [ pkgs.luajitPackages.fennel ];
  };
in {
  # Initialization file
  xdg.configFile."wezterm/${initFile}".source = builtins.toString initPath
    + "/${initFile}";
}
