set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Neovim plugins
sync:
    nvim --headless -c "Lazy! install" -c quitall

# Upgrade Neovim plugins
upgrade:
    nvim --headless -c "Lazy! update" -c quitall # TODO: Run this in the background

# Upgrade Neovim plugin manager and refresh its registry
refresh:
    nvim --headless -c "Lazy! update lazy.nvim" -c quitall # TODO: Run this in the background

# Prune Neovim plugins
prune:
    nvim --headless -c "Lazy! clean" -c quitall # TODO: Run this in the background

# Install Neovim plugin
install plugin:
    # TODO: implement this
