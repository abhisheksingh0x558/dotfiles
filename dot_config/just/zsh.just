set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# TODO: Implment other commands

# Upgrade Zsh plugins
upgrade:
    zinit update --all

# Upgrade Zsh plugin manager
refresh:
    zinit self-update
