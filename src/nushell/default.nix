{ config, ... }: {
  # Shell
  programs.nushell = {
    enable = true;
    # TODO: Merge this setting to upstream nixpkgs and remove from here
    environmentVariables =
      config.home.sessionVariables; # Mimic environment variables
  };
}
