{ config, ... }: {
  # Shell
  programs.nushell = {
    enable = true;
    # TODO: Merge this setting to upstream nixpkgs and remove from here
    environmentVariables =
      config.home.sessionVariables; # Mimic environment variables
    configFile.source = ./config.nu; # Configuration file
  };

  # UI/UX
  programs.starship.enableNushellIntegration = true; # Prompt

  # Autocompletion
  programs.carapace.enableNushellIntegration = true;
  programs.thefuck.enableNushellIntegration = true; # Autocorrection
}
