# Keymaps
$env.config.edit_mode = 'vi' # Vi mode

# UI/UX
$env.config.show_banner = false # Disable banner

# Aliases
# Git
# TODO: Source git aliases from gitconfig
alias g = git
# Git add
alias ga = git add
alias gaa = git add --all
# Git branch
alias gb = git branch
alias gbd = git branch --delete --force
# Git commit
alias gc = git commit
alias gcm = git commit --message
alias gcn = git commit --no-edit
alias gca = git commit --amend
alias gcam = git commit --amend --message
alias gcan = git commit --amend --no-edit
alias gcaa = git commit --amend --all
alias gcaam = git commit --amend --all --message
alias gcaan = git commit --amend --all --no-edit
# Git checkout
alias gco = git checkout
alias gcof = git checkout --force
# Git cherry pick
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
# Git cherry
alias gcr = git cherry
# Git diff
alias gd = git diff
alias gds = git diff --staged
alias gdu = git diff @{upstream}
# Git fetch
alias gf = git fetch
alias gfo = git fetch origin
alias gfu = git fetch upstream
# Git format patch
alias gfp = git format-patch
# Git log
alias gl = git log
alias glp = git log --patch
# Git merge
alias gm = git merge
alias gma = git merge --abort
alias gmc = git merge --continue
alias gmm = git merge (git-branch-defualt)
alias gmo = git merge origin/(git-branch-defualt)
alias gmu = git merge upstream/(git-branch-defualt)
# Git pull
alias gp = git pull
alias gpo = git pull origin
alias gpu = git pull upstream
alias gpom = git pull origin (git-branch-defualt)
alias gpum = git pull upstream (git-branch-defualt)
# Git push
alias gph = git push
alias gpho = git push origin
alias gphu = git push upstream
alias gphf = git push --force-with-lease
alias gphfo = git push --force-with-lease origin
alias gphfu = git push --force-with-lease upstream
alias gphom = git push origin (git-branch-defualt)
alias gphum = git push upstream (git-branch-defualt)
alias gphfom = git push --force-with-lease origin (git-branch-defualt)
alias gphfum = git push --force-with-lease upstream (git-branch-defualt)
# Git rebase
alias gr = git rebase
alias gra = git rebase --abort
alias grc = git rebase --continue
alias gri = git rebase --interactive
alias grri = git rebase --root --interactive
alias grm = git rebase (git-branch-defualt)
alias gro = git rebase origin/(git-branch-defualt)
alias gru = git rebase upstream/(git-branch-defualt)
# Git restore
alias gre = git restore
# Git reset
alias grs = git reset
# Git revert
alias grv = git revert
# Git status
alias gs = git status
# Git show
alias gsh = git show
# Git stash
alias gst = git stash
alias gsta = git stash apply
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
# Git switch
alias gsw = git switch
alias gswc = git switch --create
alias gsw- = git switch -
# Git worktree
alias gw = git worktree
# Chezmoi
alias cz = chezmoi
alias cza = chezmoi apply
alias czd = chezmoi diff
# Just
alias j = just
alias jc = just --choose
alias jl = just --list
alias jg = just --global-justfile
alias jgc = just --global-justfile --choose
alias jgl = just --global-justfile --list
# Kubernetes
alias k = kubectl
# Kubernetes get
alias kg = kubectl get
alias kgd = kubectl get deployments
alias kgp = kubectl get pods
alias kgs = kubectl get services
# Kubernetes describe
alias kd = kubectl describe
alias kdd = kubectl describe deployments
alias kdp = kubectl describe pod
alias kds = kubectl describe services
