{
  imports = [
    ../common
  ];

  # NixOS version
  # WARNING: Do not change this without referring to release notes for NixOS
  system.stateVersion = "24.11";

  # Flakes
  # TODO: Remove these when they are merged to nix upstream
  nix.settings.trusted-users = [ "root" "@wheel" ];

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
}
