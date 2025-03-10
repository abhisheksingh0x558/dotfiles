{ pkgs, lib, ... }:
let
  # Wallpaper for desktop, login screen, and lock screen
  wallpaperFile = "wallpaper.jpeg";
  wallpaperPath = pkgs.runCommand "wallpaper" { } ''
    mkdir -p $out
    cp ${./wallpaper.jpeg} $out/${wallpaperFile}
  '';
in {
  options.resource.wallpaper = lib.mkOption {
    type = lib.types.str;
    default = builtins.toString wallpaperPath + "/${wallpaperFile}";
  };
}
