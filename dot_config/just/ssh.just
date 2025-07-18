set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Generate SSH key
generate email="abhisheksingh0x558@proton.me" file="~/.ssh/default/auth_git_forge":
    ssh-keygen -t ed25519 -C {{ email }}  -f {{ file }}
