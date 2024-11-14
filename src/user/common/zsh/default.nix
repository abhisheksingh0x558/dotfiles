{
  # Shell
  programs.zsh.enable = true;

  # UI/UX
  programs.starship.enableZshIntegration = true;

  # Autocompletion
  programs.carapace.enableZshIntegration = true;
  programs.thefuck.enableZshIntegration = true; # Autocorrection

  # TUIs
  programs.zoxide.enableZshIntegration = true; # Change directory
}
