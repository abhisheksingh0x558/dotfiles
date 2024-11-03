let cfg = import ../../../cfg/config.nix;
in {
  imports = [ ../common ];

  # Default user
  home.homeDirectory = /Users + "/${cfg.user.default.username}";
}
