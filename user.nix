{ pkgs, ... }: {
  # Home Manager
  programs.home-manager.enable = true;

  # Home Manager version
  # WARNING: Do not change this without referring to release notes for Home Manager
  home.stateVersion = "24.05";

  # Default user
  home.username = "abhisheksingh";
  home.homeDirectory = if pkgs.stdenvNoCC.isLinux then
    /home/abhisheksingh
  else
    /Users/abhisheksingh;
}
