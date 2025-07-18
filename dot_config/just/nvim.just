set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Install Neovim plugins
sync:
    nvim --headless -c "lua require('lazy').install({ wait = true })" -c quitall

# Upgrade Neovim plugins
upgrade:
    nvim --headless -c "lua require('lazy').update({ wait = true })" -c quitall # TODO: Run this in the background

# Upgrade Neovim plugin manager
refresh:
    nvim --headless -c "lua require('lazy').update({ plugins = { 'lazy.nvim' }, wait = true })" -c quitall # TODO: Run this in the background

# Prune Neovim plugins
prune:
    nvim --headless -c "lua require('lazy').clean({ wait = true })" -c quitall # TODO: Run this in the background
