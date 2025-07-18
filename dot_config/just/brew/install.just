set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Install Brew formula
[macos]
formula app:
    brew install --formula {{ app }}
    brew bundle add --global --formula {{ app }}

# Install Brew cask
[macos]
cask app:
    brew install --cask {{ app }}
    brew bundle add --global --cask {{ app }}

# Install Brew mas app
[macos]
mas app:
    mas install {{ app }}
    brew bundle add --global --mas {{ app }}
