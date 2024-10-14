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
        "$mod, t, exec, alacritty" # Open terminal
        "$mod, t, exec, emacs" # Open editor
        "$mod, w, killactive" # Close window
        "$mod, q, exit" # Exit window manager
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
}
