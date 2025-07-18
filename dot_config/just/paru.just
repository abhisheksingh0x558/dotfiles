set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# TODO: paru --sync --needed --noconfirm [--refresh] [--sysupgrade] < {{config-install}} [&& paru --remove --unneeded --recursive --nosave --noconfirm < {{config-uninstall}}]
# TODO: paru --sync --needed --noconfirm {{tool}} => Doesn't update the global file
# TODO: paru --query --explict --quiet => Get currently installed packages

# Sync Paru apps
[linux]
sync:
    # TODO: implement this

# Upgrade Paru apps
[linux]
upgrade:
    # TODO: implement this

# Upgrade Paru and refresh its registry
[linux]
refresh:
    # TODO: implement this

# Prune Paru apps
[linux]
prune:
    # TODO: implement this

# Install Paru app
[linux]
install app:
    # TODO: implement this

# Install Paru on Arch Linux
[linux]
[script]
init:
    paru_dir=$(mktemp --directory)
    git clone https://aur.archlinux.org/paru.git "$paru_dir"
    cd "$paru_dir"
    makepkg --install --syncdeps --noconfirm
    cd -
    rm -r "$paru_dir"
