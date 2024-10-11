{ pkgs, ... }: rec {
  imports = [ ../common ];

  # Nix Darwin version
  # WARNING: Do not change this without referring to release notes for Nix Darwin
  system.stateVersion = 5;

  # System architecture
  nixpkgs.hostPlatform = "x86_64-darwin";

  # Nix daemon
  services.nix-daemon.enable = true;

  # Homebrew
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "zap"; # Uninstall stale applications

  # TODO: Merge this setting to upstream nixpkgs and remove from here
  environment.shells = [
    pkgs.nushell # Default shell
  ];

  # TODO: Merge this setting to upstream nixpkgs and remove from here
  environment.systemPackages = environment.shells;

  # Homebrew casks
  homebrew.casks = [
    "karabiner-elements" # Keymaps
    "firefox@developer-edition" # Browser
    "brave-browser" # Browser
    "alacritty" # Terminal
    "wezterm" # Terminal
    "bitwarden" # Password manager
  ];
}
