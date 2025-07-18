set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

config := home_directory() / ".config" / "paru.txt"

[linux]
default: refresh prune sync upgrade

# Install Paru applications
[linux]
sync:
    cat {{ config }} | grep --invert-match --extended-regexp '^#|^\s*$' | sed -E 's/^([[:alnum:]-]+).*/\1/' | paru --sync --needed --noconfirm -

# Upgrade Paru applications
[linux]
upgrade:
    paru --sync --sysupgrade --noconfirm # TODO: Run this in the background

# Upgrade Paru and refresh its registry
[linux]
refresh:
    paru --sync --refresh --noconfirm # TODO: Run this in the background

# Prune Paru applications
[linux]
prune:
    comm -23 <(paru --query --quiet | sort) <(cat {{ config }} | grep --invert-match --extended-regexp '^#|^\s*$' | sed -E 's/^([[:alnum:]-]+).*/\1/' | sort) | paru --remove --unneeded --recursive --nosave --noconfirm - # TODO: Run this in the background

# Install Paru application
[linux]
install app:
    paru --sync --needed --noconfirm {{ app }}

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
