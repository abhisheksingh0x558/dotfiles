{
  imports = [
    ./substituter.nix # Binary cache
  ];

  # Flakes
  # TODO: Remove these when they are merged to nix upstream
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Shell
  programs.zsh.enable = true;
}
