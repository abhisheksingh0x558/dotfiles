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

  # Shells
  # TODO: Merge this setting to upstream nixpkgs and remove from here
  environment.shells = with pkgs; [ nushell zsh ];

  # TODO: Merge this setting to upstream nixpkgs and remove from here
  environment.systemPackages = environment.shells;

  # Homebrew casks
  # TODO: Merge this setting to upstream nixpkgs and remove from here
  homebrew.casks = [
    "karabiner-elements" # Keymaps
    "firefox@developer-edition" # Browser
    "brave-browser" # Browser
    "alacritty" # Terminal
  ];
}
