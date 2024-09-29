{
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
}
