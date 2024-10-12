{ pkgs, lib, ... }:
let
  # Wallpaper for desktop, login screen, and lock screen
  wallpaperFile = "wallpaper.jpeg";
  wallpaperPath = pkgs.runCommand "wallpaper" { } ''
    mkdir -p $out
    cp ${../res/wallpaper.jpeg} $out/${wallpaperFile}
  '';
in {
  options.resource.wallpaper = lib.mkOption { type = lib.types.str; };

  config.resource.wallpaper = builtins.toString wallpaperPath
    + "/${wallpaperFile}";
}
