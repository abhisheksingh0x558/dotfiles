{ inputs, pkgs, ... }:
let
  cfg = import ../../../cfg/config.nix;

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
    ./firmware.nix # Firmware
    inputs.nixos-hardware.nixosModules.apple-t2 # NOTE: Kernal for macbook to enable wifi, keyboard, touchpad, etc.
    inputs.nixos-cosmic.nixosModules.default # Cosmic nightly overlay
    ../../../gen/hardware.nix # FIXME: Generate with `nixos-generate-config`
    ../common
    ./cosmic.nix # Desktop environment
  ];

  # NixOS version
  # WARNING: Do not change this without referring to release notes for NixOS
  system.stateVersion = "24.11";

  # System architecture
  nixpkgs.hostPlatform = "x86_64-linux";

  # Flakes
  # TODO: Remove these when they are merged to nix upstream
  nix.settings.trusted-users = [ "root" "@wheel" ];

  # Host
  networking.hostName = cfg.hostname;

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
  users.users.${cfg.user.default.username} = {
    description = cfg.user.default.name;
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

  # Default shell for all users
  users.defaultUserShell = pkgs.nushell;

  # Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
