{ inputs, ... }:
let cfg = import ../../../cfg/config.nix;
in {
  imports = [
    ./firmware.nix # Firmware
    inputs.nixos-hardware.nixosModules.apple-t2 # NOTE: Kernal for macbook to enable wifi, keyboard, touchpad, etc.
    ../../../gen/hardware.nix # FIXME: Generate with `nixos-generate-config`
    ../common
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
}
