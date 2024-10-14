{ pkgs, config, ... }:
let
  # Keymaps
  keydSettings = {
    capslock =
      "overload(control, escape)"; # Map to control if pressed with other keys and capslock to espace if pressed alone
    enter =
      "overload(control, enter)"; # Map enter to control if pressed with other keys
    space =
      "overload(alt, space)"; # Map space to alt if pressed with other keys
  };
in {
  imports = [
    ./resource.nix # Resources
  ];

  # NixOS version
  # WARNING: Do not change this without referring to release notes for NixOS
  system.stateVersion = "24.11";

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Host
  networking.hostName = "macbookpro";

  # Network
  networking.networkmanager.enable = true;

  # Boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Time zone
  time.timeZone = "Asia/Kolkata";

  # Default user
  # FIXME: Set a password with `passwd` to enable login
  users.users.abhisheksingh = {
    description = "Abhishek Singh";
    isNormalUser = true;

    extraGroups = [
      "wheel" # Enable sudo to execute commands as root
      "networkmanager" # Allow configuring network
    ];
  };

  # Keymaps
  # TODO: Add oneshot mappings for all modifiers and detect mouse/touchpad
  # TODO: Reconsider space to alt mapping
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        # Internal apple keyboard
        ids = [ "*" ];
        settings = {
          main = {
            escape = "capslock"; # Map escape to capslock
          } // keydSettings;
        };
      };

      external = {
        # External reddragon keyboard
        ids = [ "062a:8556" ];
        settings = {
          main = {
            escape = "`"; # Map escape to backtick
            "shift.escape" = "~"; # Map shift plus escape to tilda
            meta = "layer(alt)"; # Map meta to alt
            leftalt = "layer(meta)"; # Map leftalt to meta
            rightalt = "layer(meta)"; # Map rightalt to meta
          } // keydSettings;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nushell # Shell
    zsh # Shell
    kitty # Terminal
    latte-dock # Dock
  ];

  # Default shell
  users.defaultUserShell = pkgs.zsh;
  # WARNING: Required for setting defualt user shell to zsh
  programs.zsh.enable = true;

  # Display manager
  # programs.regreet = {
  #   enable = true;
  #   cageArgs = [ "-s" "-m" "last" ]; # Run display server on single monitor
  #
  #   settings = {
  #     background.path = config.resource.wallpaper; # Login screen wallpaper
  #     GTK.application_prefer_dark_theme = true; # Dark theme
  #   };
  # };
  # services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Window manager
  programs.hyprland.enable = true;
  # services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Wayland support in chromium and electron applications
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
