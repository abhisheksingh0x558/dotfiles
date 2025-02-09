# Aliases
# Git aliases
alias ga = git add
alias gaa = git add --all
alias gb = git branch
alias gbd = git branch --delete --force
alias gc = git commit
alias gca = git commit --amend
alias gcam = git commit --amend --message
alias gcan = git commit --amend --no-edit
alias gcm = git commit --message
alias gcn = git commit --no-edit
alias gco = git checkout
alias gcof = git checkout --force
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gd = git diff
alias gds = git diff --staged
alias gf = git fetch
alias gfp = git format-patch
alias gl = git log
alias gm = git merge
alias gma = git merge --abort
alias gmc = git merge --continue
alias gp = git pull
alias gph = git push
alias gphf = git push --force-with-lease
alias gr = git rebase
alias gra = git rebase --abort
alias grc = git rebase --continue
alias gri = git rebase --interactive
alias grri = git rebase --root --interactive
alias gs = git status
alias gsh = git show
alias gst = git stash
alias gsta = git stash apply
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsw = git switch
alias gswc = git switch --create

# Keymaps
$env.config.edit_mode = 'vi' # Vi mode

# UI/UX
$env.config.show_banner = false # Disable banner
