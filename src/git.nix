let cfg = import ../cfg/config.nix;
in {
  # VCS
  programs.git = {
    enable = true;

    # Default user
    userName = cfg.default.user.name;
    userEmail = cfg.default.user.email;

    extraConfig = {
      core.sshCommand =
        "ssh -i ~/.ssh/default/auth_github"; # Default github account
      init.defaultBranch = "main"; # Branch created with initialization
      fetch.prune = true; # Remove deleted remote references before fetching
      pull.rebase = true; # Pull with rebase
      push.autoSetupRemote = true; # Setup upstream branch while pushing
      rebase.autoStash = true; # Stash before rebase and apply after it
    };

    includes = [{
      # Work user
      condition = "hasconfig:remote.*.url:git@github.com:watchtowerai/*";
      contents = {
        user.email = cfg.nightfallai.user.email;
        core.sshCommand =
          "ssh -i ~/.ssh/nightfallai/auth_github"; # Work github account
      };
    }];

    # Compare files CLI
    difftastic = {
      enable = true;
      display = "inline"; # Inline diffs
    };
  };
}
