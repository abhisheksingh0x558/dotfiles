{ pkgs, ... }:
let cfg = import ../../../cfg/config.nix;
in {
  imports = [
    ./overlay.nix # Overlays
    ./nushell # Shell
    ./zsh # Shell
    ./firefox.nix # Browser
    ./brave.nix # Browser
  ];

  # Home Manager
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = cfg.user.default.username;

  # Shell prompt
  programs.starship.enable = true;

  # Shell autocompletion
  programs.carapace.enable = true;
  programs.thefuck.enable = true; # Autocorrection

  # TUIs
  programs.zoxide.enable = true; # Change directory

  # Fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
