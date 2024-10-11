let cfg = import ../cfg/config.nix;
in {
  # NixOS version
  # WARNING: Do not change this without referring to release notes for NixOS
  system.stateVersion = "24.11";

  # Flakes
  nix.settings = {
    # TODO: Remove these when they are merged to nix upstream
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "@wheel" ];
  };

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
}
