{ config, ... }: {
  # Shell
  programs.zsh = {
    enable = true;

    # Initialization files
    # TODO: Merge this setting to upstream nixpkgs and remove from here
    envExtra = builtins.readFile ./env.zsh; # Environment file
    initExtra = builtins.readFile ./rc.zsh; # Configuration file

    # Aliases
    shellAliases = config.shell.aliases;
  };

  # UI/UX
  programs.starship.enableZshIntegration = true;

  # Autocompletion
  programs.carapace.enableZshIntegration = true;
  programs.thefuck.enableZshIntegration = true; # Autocorrection

  # TUIs
  programs.zoxide.enableZshIntegration = true; # Change directory
}
