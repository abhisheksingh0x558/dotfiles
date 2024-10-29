{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Clipboard manager
      wl-clipboard
    ];
}
