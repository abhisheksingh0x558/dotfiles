{ config, ... }: {
  # Shell
  programs.zsh = {
    enable = true;

    # Aliases
    shellAliases = config.shell.aliases;

    # TODO: Add /opt/homebrew/bin to path
  };

  # UI/UX
  programs.starship.enableZshIntegration = true;

  # Autocompletion
  programs.carapace.enableZshIntegration = true;
  programs.thefuck.enableZshIntegration = true; # Autocorrection

  # TUIs
  programs.zoxide.enableZshIntegration = true; # Change directory
}
