set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Mise tools
sync:
    mise install

# Upgrade Mise tools
upgrade:
    mise upgrade --bump # TODO: Run this in the background

# Upgrade Mise and refresh its registry
refresh:
    mise self-update # TODO: Run this in the background

# Prune Mise tools
prune:
    mise prune --yes # TODO: Run this in the background

# Install Mise tool
install tool:
    mise use --global {{ tool }}

# Install Mise
init:
    curl --fail --silent --location --show-error https://mise.run | MISE_INSTALL_PATH=~/.local/bin bash
