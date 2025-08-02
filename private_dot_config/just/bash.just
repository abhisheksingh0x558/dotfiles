set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Bash plugins
sync:
    # TODO: implement this

# Upgrade Bash plugins
upgrade:
    # TODO: implement this

# Upgrade Bash plugin manager and refresh its registry
refresh:
    # TODO: implement this

# Prune Bash plugins
prune:
    # TODO: implement this

# Install Bash plugin
install plugin:
    # TODO: implement this
