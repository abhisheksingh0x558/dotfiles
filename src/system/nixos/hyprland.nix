{ config, pkgs, ... }: {
  # Display manager
  programs.regreet = {
    enable = true;
    cageArgs = [ "-s" "-m" "last" ]; # Run display server on single monitor

    settings = {
      background.path = config.resource.wallpaper; # Login screen wallpaper
      GTK.application_prefer_dark_theme = true; # Dark theme
    };
  };

  # Window manager
  programs.hyprland.enable = true;

  # Wayland support in chromium and electron applications
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # TODO: Remove this
  # WARNING: This is rquired for base hyprland config since it assumes kitty is installed
  environment.systemPackages = [ pkgs.kitty ];
}
