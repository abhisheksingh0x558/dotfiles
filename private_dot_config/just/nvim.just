set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Neovim plugins
sync:
    nvim --headless +"Lazy! install" +quitall

# Upgrade Neovim plugins
upgrade:
    nvim --headless +"Lazy! update" +quitall # TODO: Run this in the background

# Upgrade Neovim plugin manager and refresh its registry
refresh:
    nvim --headless +"Lazy! update lazy.nvim" +quitall # TODO: Run this in the background

# Prune Neovim plugins
prune:
    nvim --headless +"Lazy! clean" +quitall # TODO: Run this in the background

# Install Neovim plugin
install plugin:
    # TODO: implement this
