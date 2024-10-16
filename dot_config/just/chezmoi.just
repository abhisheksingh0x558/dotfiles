set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Sync Chezmoi dotfiles
sync:
    chezmoi apply

# Upgrade Chezmoi dotfiles
upgrade:
    chezmoi --refresh-externals update # TODO: Run this in the background

# Upgrade Chezmoi
refresh:
    chezmoi upgrade # TODO: Run this in the background

# Prune Chezmoi dotfiles
prune:
    # TODO: implement this

# Install Chezmoi
init:
    curl --fail --silent --location --show-error https://get.chezmoi.io | bash -s -- -b ~/.local/bin
