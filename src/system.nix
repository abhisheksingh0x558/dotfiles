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

  # Default user
  # FIXME: Set a password with `passwd` to enable login
  users.users.${cfg.default.user.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable sudo to execute commands as root
      "networkmanager" # Allow configuring network
    ];
    description = cfg.default.user.name;
  };
}
