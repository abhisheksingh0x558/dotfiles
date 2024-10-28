let cfg = import ../../../cfg/config.nix;
in {
  # VCS
  programs.git = {
    enable = true;

    # Default user
    userName = cfg.user.default.name;
    userEmail = cfg.user.default.email;

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
        user.email = cfg.user.nightfallai.email;
        core.sshCommand =
          "ssh -i ~/.ssh/nightfallai/auth_github"; # Work github account
      };
    }];

    # Compare files CLI
    delta.enable = true;

    # Aliases
    aliases = {
      a = "add";
      aa = "add --all";
      b = "branch";
      bd = "branch --delete --force";
      c = "commit";
      ca = "commit --amend";
      cam = "commit --amend --message";
      can = "commit --amend --no-edit";
      cm = "commit --message";
      cn = "commit --no-edit";
      co = "checkout";
      cof = "checkout --force";
      cp = "cherry-pick";
      cpa = "cherry-pick --abort";
      cpc = "cherry-pick --continue";
      d = "diff";
      ds = "diff --staged";
      f = "fetch";
      fp = "format-patch";
      l = "log";
      m = "merge";
      ma = "merge --abort";
      mc = "merge --continue";
      p = "pull";
      ph = "push";
      phf = "push --force";
      r = "rebase";
      ra = "rebase --abort";
      rc = "rebase --continue";
      ri = "rebase --interactive";
      rri = "rebase --root --interactive";
      s = "status";
      st = "stash";
      sta = "stash apply";
      std = "stash drop";
      stl = "stash list";
      stp = "stash pop";
      sw = "switch";
      swc = "switch --create";
    };
  };
}
