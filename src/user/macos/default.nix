let cfg = import ../../../cfg/config.nix;
in {
  imports = [ ../common ];

  # Default user
  home.homeDirectory = /Users + "/${cfg.user.default.username}";

  # Keymaps
  xdg.configFile."karabiner/karabiner.json".source =
    ../../../gen/karabiner.json; # Karabiner configuration file
}
