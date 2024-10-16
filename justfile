# Install Homebrew
install-brew:
	curl --fail --silent --location --show-error https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# Install Nix
install-nix:
	curl --fail --silent --location --show-error https://install.determinate.systems/nix | bash -s -- install --determinate

# Run cargo commands for Dot CLI
dot *args:
    cd dot_local/share/dot && cargo {{ args }}

# Generate SSH key
generate-ssh email='abhisheksingh0x558@proton.me' file='~/.ssh/default/auth_git_forge':
	ssh-keygen -t ed25519 -C {{email}}  -f {{file}}

# Generate GPG key
generate-gpg user='Abhishek Singh <abhisheksingh0x558@proton.me>' expiry='1y':
	gpg --quick-generate-key {{user}} default default {{expiry}}

# Export GPG key
export-gpg email='abhisheksingh0x558@proton.me':
	gpg --export --armour {{email}}
	gpg --export-secret-key --armour {{email}}
