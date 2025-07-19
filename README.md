# Dotfiles

## Prerequisites

- [Git](https://git-scm.com)

## Setup

```bash
curl --fail --silent --location --show-error https://codeberg.org/abhisheksingh0x558/dotfiles/raw/branch/main/install | bash
```

## Post-setup

1. Generate SSH keys

```bash
just --global-justfile ssh generate
```

2. Generate GPG keys

```bash
just --global-justfile gpg generate
```

3. Update remote URL for dotfiles repository

```bash
chezmoi git remote set-url origin git@codeberg.org:abhisheksingh0x558/dotfiles.git
```

4. Install Nix

```bash
just --global-justfile nix init
```
