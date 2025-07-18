set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Zsh plugins
sync:
    # TODO: implement this

# Upgrade Zsh plugins
upgrade:
    zinit update --all

# Upgrade Zsh plugin manager and refresh its registry
refresh:
    zinit self-update

# Prune Zsh plugins
prune:
    # TODO: implement this

# Install Zsh plugin
install plugin:
    # TODO: implement this
