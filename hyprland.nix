{ pkgs, config, ... }:
{
  # Window manager
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Key mappings
      "$mod" = "super"; # Prefix key
      # Keyboard
      bind = [
        "$mod, b, exec, brave" # Open browser
        # TODO: Set and use default layout for zellij
        "$mod, t, exec, wezterm start zellij --layout compact" # Open terminal
        "$mod, e, exec, wezterm start nvim" # Open editor
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
    # HYPRCURSOR_THEME = "Default";
    # HYPRCURSOR_SIZE = config.home.sessionVariables.XCURSOR_SIZE;
  };
}
