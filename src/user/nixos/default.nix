let cfg = import ../../../cfg/config.nix;
in {
  imports = [ ../common ];

  # Default user
  home.homeDirectory = /home + "/${cfg.user.default.username}";
}
