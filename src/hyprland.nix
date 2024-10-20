{ pkgs, config, ... }: {
  # Window manager
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Key mappings
      "$mod" = "super"; # Prefix key
      # Keyboard
      bind = [
        "$mod, b, exec, brave" # Open browser
        "$mod, t, exec, alacritty" # Open terminal
        "$mod, t, exec, emacs" # Open editor
        "$mod, w, killactive" # Close window
        "$mod, q, exit" # Exit window manager
        "$mod, space, exec, wofi --show drun" # Open application launcher
        "$mod, escape, exec, hyprlock" # Open screen lock
      ] ++ builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod, ${toString ws}, workspace, ${toString ws}" # Goto workspace
          "$mod shift, ${toString ws}, movetoworkspace, ${
            toString ws
          }" # Move window to workspace
        ]) 9);
      # Mouse
      bindm = [
        "$mod, mouse:272, movewindow" # Move window
        "$mod, mouse:273, resizewindow" # Resize window
      ];
    };
  };

  # Status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    # Application launcher
    wofi

    # Cursor them
    hyprcursor
  ];

  imports = [ ../res/resource.nix ];

  # Wallpaper daemon
  services.hyprpaper = {
    enable = true;

    settings = {
      # Desktop wallpaper
      preload = config.resource.wallpaper;
      wallpaper = ", ${config.resource.wallpaper}";
    };
  };

  # Screen lock
  programs.hyprlock = {
    enable = true;

    settings = {
      background.path = config.resource.wallpaper; # Screen lock wallpaper
      input-field.size = "200, 50"; # Password field size
    };
  };

  home.sessionVariables = {
    # Cursor theme
    # TODO: Expose a Home Manager option for this in upstream and remove this
    HYPRCURSOR_THEME = "Default";
    HYPRCURSOR_SIZE = config.home.sessionVariables.XCURSOR_SIZE;
  };

  # Cursor theme
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Mauve";
    package = pkgs.catppuccin-cursors.mochaMauve;
  };
}
