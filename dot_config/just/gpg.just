set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Generate GPG key
generate user="Abhishek Singh <abhisheksingh0x558@proton.me>" expiry="1y":
    gpg --quick-generate-key {{ user }} default default {{ expiry }}

# Export GPG key
export email="abhisheksingh0x558@proton.me":
    gpg --export --armour {{ email }}
    gpg --export-secret-key --armour {{ email }}
