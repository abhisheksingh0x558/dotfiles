set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Install Nix
init:
    curl --fail --silent --location --show-error https://install.determinate.systems/nix | bash -s -- install --determinate
