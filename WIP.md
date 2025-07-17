# WIP

## Neovim and emacs mappings
|          | Logical  | Visual |
| -------- | -------- | ------ |
| Start    | 0        |        |
| End      | count:$  | g$     |
| NB Start | ^        | g^     |
| NB End   | count:g_ |        |

- [ ] Enable hyperlinks for git-delta
- [ ] Git grep use ripgrep
- [ ] Git ls-files use fd
- [ ] Atuin pager direction and keymaps
- [ ] Check if shell history config is required since atuin is used now, only usecase might be warp terminal
- [ ] Enable syntax highlight on git-delta
- [ ] Set git blame pager to bat
- [ ] Set diff and diff conflict algorithm for git
- [ ] Configure filetype for bat and delta
- [ ] Install an alternative pager to less and configure delta and bat to use it
- [ ] Check what got messed up in MacOS Message app
- [ ] Replace dd, cut, tr
- [ ] Add alias for du, df, top
- [ ] Optimize chezmoi external git clones
- [ ] Enable vim.loader for neovim and similar setting for emacs
- [ ] Check if lazy, elpaca, zinit bytecompile themselves
- [ ] Fix script to remove stale, squashed branches
- [ ] Ripgrep settings like --max-columns=150, --max-columns-preview, --type-add web:*.{html,css,js}*, --smart-case
- [ ] Add settings for core utilities configured in aliases
- [ ] Secretive, Jujutsu presenterm (or alternatives), pet, taskwarrior, tmux with tpm, fzf-tab, clipboard, kubetui, oxker, xplr, yazi, ranger, midnight commander
- [ ] Git alias for merge commit mappings like reset, revert, restore, etc
- [ ] Rclone, rsync, tree, torrent, youtube dl, ffmpeg, croc, age, croc, diceware, ffmpeg, perl-Image-Exiftool, pwgen, qalculate, qrencode, zbar, locate, plocate, broot, tre
- [ ] Lnav, Rdiff-backup, kopia, bup, restic, autorestic, crestic, dysk, hyfetch
- [ ] Gitui vim bindings
- [ ] Set all terminal and editor fonts to FiraCode Nerd Font Mono
- [ ] Use private browser as default browser
- [ ] Neovim Fix gitsigns redrawing and show staged commits
- [ ] Setup gnu pass or alternative cli pass manager like passage and setup sync between password managers
- [ ] Forward all mail to proton
- [ ] Shell completions for all clis
- [ ] Shell completions for hidden dirs/files
- [ ] Replace cp and rm
- [ ] Linux clis aliases
- [ ] Cargo install cargo-binstall
- [ ] Set podman compose env var
- [ ] Setup carapace
- [ ] Linux PAM
- [ ] PDF merge, split, encrypt, decrypt
- [ ] Install diff-so-fancy and diff-highlight
- [ ] License and gitignore generator
- [ ] Add license to dotfiles
- [ ] Neovim file explorer show hidden files
- [ ] Git alias diff short and stat
- [ ] Git alias status short and stat
- [ ] Git alias rev-parse, rev-list, reflog, gc, describe, ls-files, remote, fsck, pull and push with and without stash, clone --depth --filter tree:0 --filter blob:none, push --progress
- [ ] Git alias branch -a, git tag -l, git remote -v, commit --allow-empty, commit --fixup, commit --reset-author, commit --allow-empty-message, commit --date=now, release, blame
- [ ] Git alias blame -w -M -C -C -C, grep, log -G -S, clean -d -f -x -X, sparse-checkout, clone --single-branch --sparse --branch, branch --remotes, clone --mirror
- [ ] Git alias fetch --all, pull --all
- [ ] Git commit message generator
- [ ] Fix vim global linter issue
- [ ] Torrent clients, cli, tui, gui
- [ ] Add shell directive to fix shellcheck errors
- [ ] Move language tools and clis from paru/brew to mise
- [ ] Git rebase allow working without opening editor
- [ ] Alias to define shebang for neovim and emacs
- [ ] Neovim/Emacs add undo break-points in insert mode with . , ; :
- [ ] Neovim/Emacs fix flash mappings
- [ ] Neovim/Emacs better indenting in visual mode
- [ ] Neovim/Emacs saner n and N search and same for , and ;
- [ ] Neovim/Emacs fix visual line movement and enable wrapping
- [ ] Neovim/Emacs allow subword movement
- [ ] Neovim/Emacs setup paredit or sexp
- [ ] Neovim/Emacs easier search for word and symbol mappings
- [ ] Neovim/Emacs easier search for word and symbol in buffer and project
- [ ] Neovim/Emacs treesitter install all parser when required async
- [ ] Emacs no littering
- [ ] Emacs open file in other window mappings
- [ ] Emacs highligh word under cursor using lsp
- [ ] Emacs goto next/previous occurrence of current word
- [ ] Add neovim and emacs clients for common clis/tuis/guis
- [ ] Git stash always include untracked files
- [ ] Fix emacs mode for zshrc, zshenv, zprofile
- [ ] Resolve brew arch todos
- [ ] Do not show root indent in neovim
- [ ] Setup editorconfig as per language formatters
- [ ] Git diff ignore whitespace and enable word diff
- [ ] Neovim enable lazy plugins
- [ ] Setup font ligatures (perhaphs via fira code and nerd fonts)
- [ ] Neovim gitsigns not working properly
- [ ] Neovim diffview opens for conflicts
- [ ] Neovim diffview use inline diffs
- [ ] Neovim diagnostics not working on start
- [ ] Neovim/Emacs goto next usage of word under cursor
- [ ] Setup textobject and motion for todos, indents and comments in emacs
- [ ] Setup trouble and snacks keymaps for neovim and something similar for emacs
- [ ] Install all emacs treesitter parsers eagerly when setting up and check for updates as well
- [ ] Enable inlay hints and code lens for emacs and neovim lsp
- [ ] Install Comet browser, BrowserOS, Vivaldi, Tor browser
- [ ] Install Notesnook, Joplin
- [ ] Install cosign
- [ ] Install TmuxAI, Gemini CLI terminals
- [ ] Setup bat, fd and ripgrep with fzf
- [ ] Add pnpm, uv, etc. global bin dirs to path
- [ ] Think of a better way to manage keyd
- [ ] Manage vscode and forks settings in dotfiles perhaphs via hombrew
- [ ] Manage brave and forks settings in dotfiles perhaphs via hombrew
- [ ] Replace fourmolu with ormolu
- [ ] Improve brew interface such that taps can be taken care of and --formulae is not required while arch and os are accepted as args
- [ ] Use apple keychain for ssh keys on macos and track ssh dotfiles
- [ ] Arch set hostname, locale and timezone
- [ ] Copy gpg files to work macbook
- [ ] Remove indents from gitconfig and other dotfiles
- [ ] Align commments for dotfiles
- [ ] Emacs/Neovim/Zinit use git clone --depth 1 --filter blob:none
- [ ] Run git cleanup on dotfiles
- [ ] Setup lang specific plugins for neovim
- [ ] Define LANG, LC_TYPE env vars
- [ ] Fix visual indent mappings, and add goto error and warning diagnostics mappings
- [ ] Fix nushell xdg issue in nixpkgs
- [ ] Install perplexity, telegram, whatsapp
- [ ] Install git-modes and add filetype headers to dotfiles both for git dotfils for emacs
- [ ] Add filetype headers to chezmoi (and any other pending) dotfils for both emacs and neovim
- [ ] Add treesitter support for chezmoi (and any other pending) dotfils for both emacs and neovim
- [ ] Neovim port default lsp mappings and copy those to emacs as well
- [ ] Setup linters as formatters as well for autofixing
- [ ] Commitlint with conventional commits, gitflow
- [ ] Setup mise, precious, direnv, lefthook
- [ ] Install bazel, argocd, eartly, grafana stack
- [ ] Install git-crypt, agenix, sops-nix, redis, postgres, kafka
- [ ] Install clis for encoding and hashing
- [ ] Encrypt .env file with sops age
- [ ] Setup llm language server, llm based refactoring
- [ ] Setup excalidraw, typst, mermaid, markdown, org/neorg on emacs and neovim
- [ ] Setup emacs and neovim like cursor ai
- [ ] Enable git maintainence for all repos
- [ ] Add homebrew and pacman registry to mise and remove homebrew and pacman
- [ ] Consult extensions
- [ ] Enable autocompletion doc popup for neovim and emacs
- [ ] Defer with leaf
- [ ] Emacs highlight with treesitter
- [ ] Fix emacs formatter for elisp
- [ ] Enable spell and grammar check for commits and code and comments
- [ ] Setup ubi, aqua, asdf, vfox, vagrant, arkade, devenv, flox, spack, webi, niv, devshell, devbox
- [ ] Setup gomod treesitter for neovim
- [ ] Use nushell sql history mode
- [ ] Install both non-treesitter and treesitter majors modes in emacs
- [ ] Install chezmoi plugins both for emacs and neovim
- [ ] Port all evil-unimpaired and vim-unimpaired mappings to emacs and neovim repsectively
- [ ] Port all Comment.nvim to emacs and neovim
- [ ] Difftastic as diff.tool, difftool.prompt, pager.difftool, interactive.diffFilter
- [ ] Use emacs and neovim daemon
- [ ] Setup starship, carapace, pay-respects, zoxide, fzf for nushell
- [ ] Track xdg files on nixos and macos
- [ ] Install luajit, fennel and elisp
- [ ] Enable ligatures for wezterm
- [ ] Install apple command line tools and arch base package via brew/paru
- [ ] Install moreutils, awk, frawk
- [ ] Zsh, emacs, neovim filter history
- [ ] Setup build language server
- [ ] Setup model context server
- [ ] Setup treesitter, lsp, linter, formatter, ts indentor, inc selector, ts text object, refactor, repl, snippet runner, command runner
- [ ] Switch to mastadon, signal
- [ ] Forward/migrate mails to proton from icloud, gmail, and outlook
- [ ] Pin neovim, emacs, and zsh plugins
- [ ] Lazy load zsh plugins
- [ ] Bytecompile lua, zsh and elisp
- [ ] Reformat and add comments to karabiner.json
- [ ] Use fast-tags for haskell, and other tags for other langs
- [ ] Disable neovim font level in gutter
- [ ] Disable neovim todo hints in gutter
- [ ] Emacs put nerd-icon-install-fonts into init.el
- [ ] Track gh cli config
- [ ] Install file watchers for all languages
- [ ] Enable XDG for both macos and nixos specially for nushell and zsh
- [ ] Install xcode cmdline tools and base-devel via install script
- [ ] Enable homebrew autoupdate and other options
- [ ] Add location and i18n and console settings by referring to nixos configuration
- [ ] Add github read:project token via nix
- [ ] Copy nixos system setting to macos system settings
- [ ] Track scroll settings for macos and nixos
- [ ] Install corresponding packages for macos on linux
- [ ] Check cmdline completion via noice/nvim-cmp
- [ ] Split large neovim and emacs commits and configure conventional commits modules and add module scope to existing commits
- [ ] Add script to clone all github repos
- [ ] Remove cosmic default applications
- [ ] Make brave, neovim and wezterm (with zellij) as default programs
- [ ] Extract fonts, themes, etc. to config file for all terminals, etc.
- [ ] Install debug adapters for all languages
- [ ] Install test suites for all languages
- [ ] Enable nushell integration for zellij
- [ ] Configure pre commit hooks
- [ ] Highlight injected sql
- [ ] Make brave, alacritty, etc transparent
- [ ] Rename boot loader
- [ ] Since nix store is world readable, encrypt secure files in it
- [ ] Encrypt netrc
- [ ] Use age/sops/git crypt/bitwarden/keybase
- [ ] Validate if no secrets were commited to dotfiles repo ever
- [ ] Install mail client, rss feed reader, iirc, matrix, discord, slack, etc. clients
- [ ] Migrate to neovim 0.11 native lsp config, completion, native snippet engine, only use snippets templates
- [ ] Migrate to neovim terminal, project manager, file explorer, formatter, folder, linter and any other native features
- [ ] Migrate to emacs tempel from yasnippet once it is stable
- [ ] Gdrive, Onedrive, Dropbox, etc.
- [ ] Kubernetes, aws, gcp, azure, gh, wireguard, teleport
- [ ] Add named directories to zsh
- [ ] Fzf keymaps
- [ ] Fzf ordering
- [ ] Git lfs
- [ ] Git merge multiple repos
- [ ] Git smudge and clean filters
- [ ] Git attributes
- [ ] Neovim/Emacs - which key
- [ ] Neovim/Emacs - manage scratch buffers
- [ ] Neovim/Emacs - manager terminals and repls
- [ ] Neovim/Emacs - emmet
- [ ] Neovim/Emacs - blamer
- [ ] Neovim/Emacs - git blame mappings for current line instead of entire buffer
- [ ] Neovim/Emacs - Completion previous both in in-buffer and mini-buffer modes
- [ ] Neovim/Emacs - add LSP capabilities for neovim blink.cmp and lsp-snippet for emacs
- [ ] Neovim/Emacs - add autocompletion to terminals
- [ ] Neovim/Emacs - auto add bracets to autocompleted functions/methods
- [ ] Neovim/Emacs - whichkey
- [ ] Neovim/Emacs - Setup support for ron and kdl files
- [ ] Neovim/Emacs - Configure treesitter plugin to update parsers
- [ ] Neovim - treesitter enable incremental_selection, indent, folding, textobjects select, textobjects swap, textobjects move, textobjects lsp_interop, pairs, locals, injections
- [ ] Emacs - marginalia
- [ ] Emacs - treesit-auto
- [ ] Emacs - embark
- [ ] Emacs - projectile
- [ ] Emacs - ein
- [ ] Emacs - dabbrev
- [ ] Emacs - corfu-history
- [ ] Emacs - eldoc-mode
- [ ] Emacs - eglot-mode
- [ ] Emacs - repeat-mode
- [ ] Emacs - dape-mode
- [ ] Emacs - fido-vertical-mode
- [ ] Emacs - icomplete-vertical-mode
- [ ] Emacs - herculus
- [ ] Application consideration: Apple > 3P > Neovim > Emacs, GUI > TUI > CLI, Free > Paid
- [ ] Do not enable OAuth for any platform unless no other option is available
- [ ] Keep Apple, Google and Microsoft password in Apple password manager and all other passwords in Google password manager
- [ ] For Google and Microsoft mails login from respective IDs instead of Icloud ID
- [ ] Enable cloud sync for all applications that support it
- [ ] Enable MFA for platforms using Google password manager if supported by the platform
- [ ] Migrate to Microsoft mail from Apple mail
- [ ] Migrate to Google password manager from Apple password manager
- [ ] Recheck 2FA and OAuth for Google, Microsoft and Apple
- [ ] Prefer passkey logins
- [ ] Add schedule for all password resets and reset all passwords
- [ ] Migrate to Chrome from Safari
- [ ] Prefer American English everywhere
- [ ] Use API keys to interact with 3p applications instead of oauth
- [ ] Prefer working without login unless necessary in any application
- [ ] Prefer not sharing diagnostics or usage data from any application
- [ ] Support for texinfo and man-pages files
- [ ] Replace sudo with sudo-rs
- [ ] Emacs languages - Bash/Sh
- [ ] Emacs languages - C++
- [ ] Emacs languages - CSS
- [ ] Emacs languages - Clojure
- [ ] Emacs languages - Common Lisp
- [ ] Emacs languages - Conf/Gitconf
- [ ] Emacs languages - Docker/compose
- [ ] Emacs languages - Podman/compose
- [ ] Emacs languages - Elisp
- [ ] Emacs languages - HTML
- [ ] Emacs languages - Fennel
- [ ] Emacs languages - Java
- [ ] Emacs languages - Javascript
- [ ] Emacs languages - Json
- [ ] Emacs languages - Julia
- [ ] Emacs languages - Justfile
- [ ] Emacs languages - Kotlin
- [ ] Emacs languages - Latex
- [ ] Emacs languages - Lua
- [ ] Emacs languages - Makefile
- [ ] Emacs languages - Markdown
- [ ] Emacs languages - Neorg
- [ ] Emacs languages - Nix
- [ ] Emacs languages - Nu
- [ ] Emacs languages - Obsidian
- [ ] Emacs languages - Org
- [ ] Emacs languages - Proto
- [ ] Emacs languages - Purescript
- [ ] Emacs languages - Python
- [ ] Emacs languages - Racket
- [ ] Emacs languages - Regex
- [ ] Emacs languages - Sass
- [ ] Emacs languages - Scheme
- [ ] Emacs languages - SCSS
- [ ] Emacs languages - Sql with dialects
- [ ] Emacs languages - Opentofu/terragrunt
- [ ] Emacs languages - Toml
- [ ] Emacs languages - Editorconfig
- [ ] Emacs languages - Typescript
- [ ] Emacs languages - Typst
- [ ] Emacs languages - XML
- [ ] Emacs languages - Yaml
- [ ] Emacs languages - Zig
- [ ] Emacs languages - Zsh
- [ ] Neovim languages - Conf/Gitconf
- [ ] Neovim languages - Docker/compose
- [ ] Neovim languages - Podman/compose
- [ ] Neovim languages - Elisp
- [ ] Neovim languages - Java
- [ ] Neovim languages - JavaScript
- [ ] Neovim languages - Julia
- [ ] Neovim languages - Latex
- [ ] Neovim languages - Opentofu/terragrunt
- [ ] Neovim languages - Markdown
- [ ] Neovim languages - Neorg
- [ ] Neovim languages - Obsidian
- [ ] Neovim languages - Org
- [ ] Neovim languages - Elm
- [ ] Neovim languages - Regex
- [ ] Neovim languages - Sass
- [ ] Neovim languages - Scheme
- [ ] Neovim languages - Sql with dialects
- [ ] Neovim languages - Typescript
- [ ] Neovim languages - Typst
- [ ] Neovim languages - Editorconfig
- [ ] Neovim languages - XML
- [ ] Neovim plugins - nvim-lsp-selection-range
- [ ] Neovim plugins - telescope-frecency
- [ ] Neovim plugins - nvim-spyder
- [ ] Neovim plugins - multicursors.nvim
- [ ] Neovim plugins - Yanky
- [ ] Neovim plugins - Marks
- [ ] Neovim plugins - Undos
- [ ] Neovim plugins - HTML
- [ ] Neovim plugins - CSS
- [ ] Neovim plugins - SCSS
- [ ] Neovim plugins - Jumps
- [ ] Neovim plugins - Changes
- [ ] Neovim plugins - Harpoon
- [ ] Neovim plugins - Arrow
- [ ] Neovim plugins - Transient mode
- [ ] Neovim plugins - Rainbow mode for CSS
- [ ] Neovim plugins - PKM tools - obsidian, roam, etc.
- [ ] Emacs packages - Combobulate
- [ ] Emacs packages - magit-todos
- [ ] Emacs packages - dired-x, dired-aux, dired-plus
- [ ] Emacs packages - goto-chg.el
- [ ] Emacs packages - no-littering
- [ ] Emacs packages - lsp-booster
- [ ] Emacs packages - dump-jump
- [ ] Emacs packages - multicursors
- [ ] Emacs packages - hippie-expand
- [ ] Emacs packages - Try
- [ ] Emacs packages - Snippets
- [ ] Emacs packages - Auto pairs
- [ ] Emacs packages - Autocompletion
- [ ] Emacs packages - VCS
- [ ] Emacs packages - Treesitter plugins
- [ ] Emacs packages - LSP tools
- [ ] Emacs packages - Refactoring tools
- [ ] Emacs packages - Linter
- [ ] Emacs packages - Folding - Origami
- [ ] Emacs packages - Terminal manager
- [ ] Emacs packages - Filesystem manager - sidebar and buffer
- [ ] Emacs packages - Project manager
- [ ] Emacs packages - Code outliner
- [ ] Emacs packages - Task runner
- [ ] Emacs packages - Test runner
- [ ] Emacs packages - Code runner
- [ ] Emacs packages - REPL runner
- [ ] Emacs packages - thing-at-point
- [ ] Emacs packages - evil-textobj-tree-sitter
- [ ] Emacs packages - Debugger
- [ ] Emacs packages - PKM tools - obsidian, roam, etc.
- [ ] Emacs packages - Session manager
- [ ] Emacs packages - Text case
- [ ] Emacs packages - Inc/Dec operator
- [ ] Emacs packages - Split join
- [ ] Emacs packages - Move/duplicate operator
- [ ] Emacs packages - Find and replace
- [ ] Emacs packages - Text objects plain and treesitter based
- [ ] Emacs packages - Annotation generator
- [ ] Emacs packages - Alternate files
- [ ] Emacs packages - Scratch files
- [ ] Emacs packages - Transient mode
- [ ] Emacs packages - Rainbow mode
- [ ] Emacs packages - Icons
- [ ] Emacs packages - Tabline
- [ ] Emacs packages - Statusline
- [ ] Emacs packages - UI components
- [ ] Emacs packages - Highlight word under cursor
- [ ] Emacs packages - Virtual text to discover motions
- [ ] Emacs packages - Window layout manager
- [ ] Emacs packages - Yanky
- [ ] Emacs packages - Marks
- [ ] Emacs packages - Undos
- [ ] Emacs packages - Jumps
- [ ] Emacs packages - Changes
- [ ] Emacs packages - Harpoon
- [ ] Emacs packages - Arrow
- [ ] Emacs packages - Jinx
- [ ] Emacs packages - Taskrunner
- [ ] Emacs packages - Persp
- [ ] Emacs packages - Eat
- [ ] Emacs packages - Avy
- [ ] Neovim improvments - Fix neogit tab handling
- [ ] Neovim improvments - Add conflict marker mappings
- [ ] Neovim improvments - Fix neogit log buffer top line issue
- [ ] Neovim improvments - Fugitive with cloud integrations
- [ ] Neovim improvments - Targets
- [ ] Neovim improvments - Lion
- [ ] Neovim improvments - Render markdown
- [ ] Neovim improvments - Fix neogit rebase modify
- [ ] Neovim improvments - Fix neogit char wise diff
- [ ] Neovim improvments - Check paredit, parinfer, vim-sexp vs nvim-treesitter-sexp
- [ ] Neovim improvments - Check if refactoring plugings are required
- [ ] Neovim improvments - Snacks
- [ ] Neovim improvments - Mini
- [ ] Neovim improvments - Add ft filters to language plugins
- [ ] Configure boot loaded as systemd and check what nixos setting efi.canTouchEfiVariables does
- [ ] Wayland support in chromium and electron applications via environment.sessionVariables.NIXOS_OZONE_WL = "1";
- [ ] Emacs packages - UI/UX - doom-themes # Theme
- [ ] Emacs packages - UI/UX - nerd-icons # Icons
- [ ] Emacs packages - UI/UX - doom-modeline # Modeline
- [ ] Emacs packages - UI/UX - dashboard # Dashboard
- [ ] Emacs packages - Treesitter integration - treesit-grammars.with-all-grammars # Language grammars
- [ ] Emacs packages - Treesitter integration - tree-sitter-langs # Language queries
- [ ] Neovim plugins - Keymaps - dial-nvim # Increment and decrement operator
- [ ] Neovim plugins - Keymaps - treesj # Split and join operator
- [ ] Neovim plugins - Keymaps - nvim-gomove # Move and duplicate block operator
- [ ] Neovim plugins - Keymaps - nvim-various-textobjs # Text objects
- [ ] Neovim plugins - Keymaps - other-nvim # Alternative files
- [ ] Neovim plugins - Keymaps - neogen # Annotation generator
- [ ] Neovim plugins - Keymaps - scretch-nvim # Scratch files
- [ ] Neovim plugins - UI/UX - tabby-nvim # Tabline
- [ ] Neovim plugins - UI/UX - feline-nvim # Statusline
- [ ] Neovim plugins - UI/UX - dashboard-nvim # Dashboard
- [ ] Neovim plugins - UI/UX - nvim-notify # UI for notifications
- [ ] Neovim plugins - UI/UX - focus-nvim # Window layout manager
- [ ] Neovim plugins - UI/UX - edgy-nvim # Window layout manager
- [ ] Neovim plugins - Autocompletion - nvim-scissors # Manage snippets
- [ ] Neovim plugins - Treesitter integration - nvim-treesitter-textsubjects # Treesitter context aware text objects
- [ ] Neovim plugins - Treesitter integration - nvim-ts-autotag # Manipulate tag pairs
- [ ] Neovim plugins - Treesitter integration - nvim-treesitter-pairs # Manipulate pair objects
- [ ] Neovim plugins - Treesitter integration - nvim-treesitter-sexp # Manipulate S-expressions
- [ ] Neovim plugins - Treesitter integration - nvim-ts-context-commentstring # Manipulate comments
- [ ] Neovim plugins - Treesitter integration - nvim-paredit # Paredit implementation for neovim
- [ ] Neovim plugins - Refactoring - nvim-treesitter-refactor
- [ ] Neovim plugins - Refactoring - refactoring-nvim
- [ ] Neovim plugins - Refactoring - inc-rename-nvim
- [ ] Neovim plugins - Project manager - project-nvim
- [ ] Neovim plugins - Task runner - overseer-nvim
- [ ] Neovim plugins - Notebook runner - molten-nvim
- [ ] Neovim plugins - Session manager - persistence-nvim
- [ ] Emacs/Neovim - run as daemon
- [ ] Neovim - try plugins
- [ ] Option to show tab chars in neovim and emacs
- [ ] Themes - Brave
- [ ] Themes - Emacs
- [ ] Themes - Neovim
- [ ] Themes - Zellij
- [ ] Themes - Alacritty
- [ ] Themes - Hyprland
- [ ] Themes - Waybar
- [ ] Themes - Fzf
- [ ] Themes - Bat
- [ ] Themes - Lazygit
- [ ] Themes - Rofi
- [ ] Themes - Starship
- [ ] Themes - Nushell
- [ ] Themes - Difftastic
- [ ] Themes - Neovim feline
- [ ] Themes - Neovim tabby
- [ ] Themes - Cosmic
- [ ] Themes - Firefox
- [ ] Themes - Wezterm
- [ ] Arch linux dunst

---

# Arch Linux MacBook Installation
1. Disable secure boot
2. Boot from iso as root
3. Connect to wifi via iwctl
4. Partition /dev/nvme0n1 with fdisk to create 1 root partition with entire remaining space
5. mkfs.ext4 /dev/nvme0n1p5
6. mount /dev/nvme0n1p5 /mnt
7. mount —mkdir /dev/nvme0n1p1 /mnt/boot
8. Install packages via pacstrap and configure pacman repos if required
9. Generate fstab
10. Chroot
11. Set time, locale and hostname
12. Create user with wheel group
13. Set password for new user
14. Enable sudo for wheel group
15. Lock root user
16. systemctl enable t2fanrd
17. Setup systemd as boot manager
18. Reboot and enable secure boot
19. Enable greeter
20. Setup network
21. Setup dotfiles
22. Generate ssh and gpg keys
23. Change shell to zsh

# NixOS MacBook Installation
1. Disable secure boot
2. Boot from iso as root
3. Mount usb with wifi firmware to /media/usb
4. Extract firmware archive to /lib/firmware/brcm
5. Reload wifi firmware modules
6. systemctl start wpa_supplicant
7. Connect to wifi via wpa_cli
8. Partition /dev/nvme0n1 with fdisk to create 1 500MB boot partition and 1 root partition with remaining space
9. parted /dev/nvme0n1 — set 4 esp on
10. mkfs.ext4 -L nixos /dev/nvme0n1p5
11. mkfs.fat -F 32 -n boot /dev/nvme0n1p4
12. mount /dev/disk/by-label/nixos /mnt
13. mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
14. nixos-generate-config —root /mnt
15. cd /mnt/etc/nixos
16. Clone dotfiles into /tmp
17. Copy new hardware config
18. nix flake update
19. nixos-install —no-root-passwd —flake <name>
20. install home manager
21. Reset password for user
22. Reboot and lock root and reset user password
23. Enable secure boot
24. Generate ssh keys
25. Change shell to zsh

# Nix MacOS Installation
1. Install via determinate installer
2. Install Xcode command line tools
3. Install homebrew
4. chpass -s /run/current-system/sw/bin/nu
5. Set default browser to brave from settings
6. Generate ssh keys
7. NOT REQUIRED - Track /etc/nix/nix.conf

---

# Workstation Setup

1. Framework laptop with nixos and arch linux
2. Starlite tab
3. Odysee
4. Pixel with graphene
7. Comet
8. Codeberg
9. Gitea
10. Forgejo
10. LBRY/odysee
12. Fleet
12. Kiro
12. Httpie GUI
13. Neovide and lazyvim
14. Doom
15. Pass
16. Kakoune
17. Rectangle
18. Chrome with Google Search and Google Maps and Search enhancements and Onenote clipper
20. Anydesk
22. Zen
23. Spotlight
24. Outlook and Teams with Calendar, Contacts, Todos
25. Airmail
26. Canary Mail
27. Thunderbird
28. Hoppscotch
29. NocoDB
30. Onenote
31. Google Finance and News
32. Onedrive
33. Google Drive
34. Dropbox
35. Seafile
36. Microsoft Password Manager and Authenticator
37. Microsoft 365 on Chrome (Excel, Word, Powerpoint, Lists, Loop, Whiteboard, Visio)
38. Discord
40. Reddit
40. Medium
40. Hacker news
40. Bluesky
40. ORCID
41. Twitter
42. Gitter
43. Stack Overflow and Stack Exchange
45. Terraspace
45. Openspace
45. Kubectl
46. Containerd
48. Systemd
49. Colima
50. Haskell with Stack and Cabal
51. Git and Git LFS
52. Yaml
53. Tex and LaTex
54. UML and PlantUML
54. Graphviz
55. Archimate
56. Mathjax
57. MathML
58. Markmap
59. Markdown
60. Github
61. Gitlab
62. Gerrit
63. AWS
64. Azure
65. Amazon Kindle with Kindle unlimited
66. PS5 with PS Plus, EA, GTA+
67. Xbox X with game pass
68. Steam
69. Firestick
70. Echo dot
71. Google Books
72. GCP
73. Firebase
74. PostgreSQL
75. MongoDB
76. Redis
76. Valkey
77. RabbitMQ
78. FIDO2
79. OpenSearch
80. Apple Messages and Facetime and Contacts
83. Gemini
89. Microsoft Copilot
83. Grok
84. Github Copilot
82. DiagramGPT and Eraser IO
6. Bolt
96. Replit
85. Whisper
86. Codeium
87. Codex
87. LocalAI
87. Open-codex
87. Perplexica
88. Tabnine
90. Drafts
91. Notability
92. Goodnotes
93. Concepts
94. Excalidraw
95. Draw.io
97. Vimcal
98. Mindnode
99. DevTo
100. Alexa
101. Fire code fonts
102. Siri
103. Numi
104. Things
105. Bear
106. Bartender
107. Noir
108. Unclutter
109. App Cleaner
111. Pocket
112. Swish
113. Keychain
114. KeypassXC
115. Hazel
116. Keysmith
117. Authy
118. Grammarly
119. Caffeinate
120. Numbers, Keynote, Pages, Textedit
121. DevTo
122. Snippet
125. Xcp
126. Onivim
127. Unarchiver
128. 2FAS
129. Proton mail, calendar, pass keep, drive
130. Devin & Devika
131. Langchain
132. Element and matrix
133. Appflowy
134. Affine
135. Anytype
136. Mattermost
137. Jitsi and Bigbluebutton
138. Joplin
139. Trilium Notes
140. Focalboard
141. Nextcloud
141. System monitoring GUIs/webapps
141. Cron modern alternative
142. Sol
143. Plane
144. Discourse
145. Xournal
146. Nebo
147. Saber
148. Rnote
149. Loose Leaf
150. Helix
151. Amp
152. Lapce
153. Rim
154. uBlock Origin
155. Pandoc
156. Penpot
157. Elest.io
158. Plasmic
159. Qemu
161. UTM
162. Parallels
163. Wine and Proton
164. Darling
165. VirtualBox
166. Hyperfine
167. VMware
168. Coroot
171. Vault and bitwarden secret manager
172. Wireguard and teleport
178. Table Plus
179. Tabby
181. RSS reader
182. Mailing list
183. IRC chat
184. Public file and code sharing tools
185. Himalaya
186. Gritql
187. Hydra
188. Mastodon
189. Bazaar
192. AST grep
194. Ouch
195. Viddy
199. Pomodoro and kanban
200. Codespell
201. Agra
202. Clean architecture
203. Clean code
206. Dart
207. Design patterns
208. System Design
209. Docker
210. DSA
211. Elm
212. Excel
213. FFI
214. Git with flow and conventional commits
216. GraphQL
217. GRPC
218. Rest with OData
220. Idris
221. Kafka
222. Temporal
223. Knative
224. Kubeless
225. OpenFaaS
225. K3s
226. Kotlin
227. Kubernetes
228. Mongo
229. Cassandra
233. Postgres
234. Influx
235. Prolog
236. Purescript
237. Clojurescript
239. RabbitMQ
241. Redis
246. Julia
247. Scheme
248. TCP
249. Typescript
251. OpenShift
252. OpenStack
255. Terraspace
256. Terramate
257. Istio
258. Saily - esim
259. LocalStack
260. AWS
261. Azure
262. GCP
263. Minikube
264. Kind
265. Memcached
266. Elasticsearch
267. Airflow
268. Hadoop
269. Prometheus
270. Thanos
271. Grafana
272. Loki
273. Tempo
274. Mimir
275. Pyroscope
276. Logstash
277. Kibana
278. Opentelemetry
279. Opentracing
280. Message queue
281. Message broker
282. Event bus
283. Event stream
284. Pub sub
286. Signoz
287. Statsd
288. Htmx
289. Hyperscript
290. Void
290. Cline
291. Sdkman
292. Volta
293. Vercel
294. Cockpit
295. Technical documentation with Diátaxis
295. Guile
295. Guix
271. Mixpanel
271. Openpanel
271. Webhook.site
271. Codesign

Think of ETL and warehouse tools as well
Store configs in github -> dropbox -> cloud -> 3p cloud

Brewfile home

Brewfile work
brew "highway"
brew "cryptography"
brew "sqlite"
brew "bandwhich"
brew "c-ares"
brew "bitwarden-cli"
brew "bottom"
brew "glances"
brew "htop"
brew "bpytop"
brew "gdu"
brew "dua"
brew "atop"
brew "ncdu"
brew "coreutils"
brew "duf"
brew "dust"
brew "fcp"
brew "git-flow"
brew "git-lfs"
brew "unbound"
brew "libgpg-error"
brew "libksba"
brew "npth"
brew "golangci-lint"
brew "gping"
brew "helix"
brew "jid"
brew "jupyterlab"
brew "kafka"
brew "kind"
brew "kn"
brew "krew"
brew "kubergrunt"
brew "libavif"
brew "libpq"
brew "librsvg"
brew "lua"
brew "luajit"
brew "luarocks"
brew "luv"
brew "mcfly"
brew "memcached"
brew "tree-sitter"
brew "openjdk@17"
brew "pass"
brew "pgformatter"
brew "fpp"
brew "postgresql@16", restart_service: true, link: true
brew "procs"
brew "rclone"
brew "redis", restart_service: true
brew "rlwrap"
brew "rm-improved"
brew "teleport"
brew "temporal"
brew "terraform-ls"
brew "vscode-langservers-extracted"
brew "whalebrew"
brew "yaml-language-server"
brew "knative-extensions/kn-plugins/func"
brew "knative-extensions/kn-plugins/quickstart"
brew "localstack/tap/localstack-cli"
brew "reviewdog/tap/reviewdog"
brew "graphql-cli"
cask "affine"
cask "anytype"
cask "appcleaner"
cask "asana"
cask "bloomrpc"
cask "chatgpt"
cask "font-fira-code"
cask "font-fira-code-nerd-font"
cask "font-hack-nerd-font"
cask "grammarly-desktop"
cask "jetbrains-toolbox"
cask "miro"
cask "neovide"
cask "pgadmin4"
cask "readdle-spark"
cask "redisinsight"
cask "teleport-connect"
cask "vimr"
whalebrew "directory"
vscode "1yib.rust-bundle"
vscode "aaron-bond.better-comments"
vscode "bodil.file-browser"
vscode "bradymholt.pgformatter"
vscode "dunn.redis"
vscode "dustypomerleau.rust-syntax"
vscode "eamodio.gitlens"
vscode "editorconfig.editorconfig"
vscode "fill-labs.dependi"
vscode "formulahendry.code-runner"
vscode "github.copilot"
vscode "github.copilot-chat"
vscode "github.vscode-pull-request-github"
vscode "golang.go"
vscode "hashicorp.hcl"
vscode "hashicorp.terraform"
vscode "haskell.haskell"
vscode "honnamkuan.golang-snippets"
vscode "jacobdufault.fuzzy-search"
vscode "justusadam.language-haskell"
vscode "kahole.magit"
vscode "mechatroner.rainbow-csv"
vscode "ms-azuretools.vscode-docker"
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"
vscode "ms-python.debugpy"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "phoityne.phoityne-vscode"
vscode "redhat.vscode-yaml"
vscode "rust-lang.rust-analyzer"
vscode "streetsidesoftware.code-spell-checker"
vscode "vector-of-bool.gitflow"
vscode "vivaxy.vscode-conventional-commits"
vscode "vscode-icons-team.vscode-icons"
vscode "vscodevim.vim"
vscode "vspacecode.vspacecode"
vscode "vspacecode.whichkey"
vscode "zhuangtongfa.material-theme"
vscode "zxh404.vscode-proto3"
Vscode error lens
Vscode container tools
Vscode makefile tools
Vscode rest client
Vscode sql tools
Vscode direnv

Browser extensions
- bitwarden
- protopass
- ublock origin
- github downloader
- color picker
- json formatter
- check other extensions

---

# Haskell

## Tips
1. Use dependent types
2. Use refinement types
3. Use existential types
4. Use rank-n types
5. Use phantom types
6. Use free/freer monads
7. Use type applications
8. Use CLI lib to parse args, and applicative parsing (optparse-applicative)
9. Use applicatives, functors, contravariaint, monoids, alternatives, divisible, decidable, mmorph, HoleyMonoid
10. Use bifunctors, biapplicatives, profunctors, coapplicative, coalternative
11. Use traversables, foldables,
12. Use type level programming
13. Use monads and comonads, transformers and mtl classes as last resort only
14. Use strong, forget, choice, category, arrow as last resort only
15. Use backpack libs and lenses, prisms, isos, folds and traversals, getters and setters
16. Use pattern synonyms
17. Use generic deriving strategies
18. Use string formatting lib, Text and Bytestring
19. Use vector, hashtables, exceptions, filepath, directory, process, primitive, exceptions, pathtype, path
20. Use combinators
21. Use safe exceptions and safe haskell
22. wreq, aeson, co-log, monad-logger, servant, persistent, katip
23. Use liftA2, liftM, liftM2, ap
24. Use async and stm and st monad, free, freer-simple and polysemy, monad-par, parallel, unliftio, monad-control, lifted-base, monad-coroutine, Coroutine
25. Use category, strong, choice, arrow, semigroups, semigroupoids, groups, group-theory
26. Use comonoid, cosemigroup, cosemigroupoid, co-traversable, co-foldable, distributive
27. Use forget, tagged, hashable, cereal (or binary), deepseq, void, safe, safecopy
28. Use non-empty versions of ordered containers and justified versions of unordered ones
29. Use hpack
30. Use relude or rio or universium or foundation or protolude or base-prelude or classy-prelude or base-noprelude or basic-prelude or rebase or safe-prelude or papa or safe or whip up your own
31. Use microlens and typed-process and fail
32. Use dotenv-hs with yaml
33. Use pre-commit hooks to check complexity, test, lint, format, and spell
34. Use commit-lint and pre-commit
35. Use hi templates and stack templates and github templates
36. Use dlist and array and either and these
37. Use libs with safe and typed prefixes
38. Use regex-applicative, modern-uri, megaparsec
39. Use CPP, INLINABLE, INLINE, SPECIALIZE
40. Use pipes and conduit like libs
41. ghc-options: -threaded, -rtsopts, -with-rtsopts=-N
42. kan-extensions, regex
43. typeclass for filters, selective, witherable, filterable, indexed-traversable, invertible, invariant
44. Prefer cereal over binary
45. htrace, hood, debug, Hoed, hat are good for debugging
46. Use Text Show and Text Show Instances
47. Check resource-pool, resourcet, acquire
48. Use context for storing thread context/MDC
49. Use bytes, distributive (dual to traversable), monad-primitive, reflection, strict
50. Use dual and contravarient to prelude classes
51. Use brick, pretty-simple, wl-pprint-text
52. Use hake and shake for building
53. Use fix points and uniplate and fix plate
54. Ghcid

## Libs
1. base
2. thyme
3. time
4. text
5. bytestring
6. string-interpolate
7. fmt
8. vector
9. containers
10. unordered-containers
11. transformers
12. mtl
13. stm
14. safe-exceptions
15. unliftio
16. async
17. free
18. polysemy
19. contravariant
20. comonad
21. bifunctors
22. profunctors
23. lens
24. aeson
25. aeson-casing
26. lens-aeson
27. base64
28. cryptonite
29. co-log-json
30. wreq
31. http-types
32. http-client
33. persistent
34. persistent-sqlite
35. servant
36. servant-server
37. wai
38. wai-extra
39. warp
40. cache
41. primitive
42. template-haskell
43. hunit
44. hspec
45. doctest
46. quickcheck
47. hedgehog
48. tasty

## Architecture
1. Adapter
    1. Cache
        1. Redis
            1. Foo
            2.
        2.
    2. Client
        1. Rest
            1. Foo
            2.
        2.
    3. Handler
        1. Rest
            1. Foo
            2.
        2. Command
        3.
    4. Repository
        1. Postgres
            1. Foo
            2.
    5. Serializer
        1. Yaml
            1. Foo
            2.
    6. Stream
        1. Kafka
            1. Foo
            2.
    7. ServiceClient
        1. Foo
        2.
    8. ApiClient
        1. Rest
            1. Foo
            2.
    9. Application.hs
    10.
2. Entity
    1. Foo
    2.
3. Driver
    1. Application.hs
    2. Rest.hs
    3. Postgres.hs
    4. Redis.hs
    5. <Main.hs>
    6.
4. Usecase
    1. Cache
        1. Foo
        2.
    2. Client
        1. Foo
        2.
    3. Repository
        1. Foo
        2.
    4. Service
        1. Foo
        2.
    5. Serializer
        1. Foo
        2.
    6. Stream
        1. Foo
        2.
    7. ApiClient
        1. Foo
        2.
    8. ServiceClient
        1. Foo
        2.
    9.
5. Main.hs

Keep gitignore, editorconfig, gitattributes, justfile, fourmolu.yaml, hlint.yaml and other formatter and linter configs etc. in every project
Avoid editor/ide configs in the project and keep platform file ignores in global gitignore
Think where to keep hooks like stream (e.g. core-hook)

## Relude
- base
- bytestring
- containers
- deepseq
- ghc-prim
- hashable
- mtl
- stm
- text
- transformers
- unordered-containers

## Rebase
- base
- bifunctors
- bytestring
- comonad
- containers
- contravariant
- deepseq
- dlist
- either
- groups
- hashable
- invariant
- mtl
- profunctors
- scientific
- selective
- semigroupoids
- stm
- text
- time
- time-compat
- transformers
- unordered-containers
- uuid-types
- vector
- vector-instances
- void

## Protolude
- array
- async
- base
- bytestring
- containers
- deepseq
- ghc-prim
- hashable
- mtl
- mtl-compat
- stm
- text
- transformers
- transformers-compat

## Template package.yaml
```
verbatim:
  cabal-version: 3.4

name: lib
version: 0.0.1

language: GHC2021
ghc-options:
  - -Weverything
  - -Wno-missing-safe-haskell-mode
  - -Wno-unsafe
default-extensions:
  - ApplicativeDo
  - Arrows
  - BlockArguments
  - CPP
  - DataKinds
  - DefaultSignatures
  - DeriveAnyClass
  - DerivingStrategies
  - DerivingVia
  - DuplicateRecordFields
  - ExtendedDefaultRules
  - FunctionalDependencies
  - GADTs
  - ImplicitParams
  - ImpredicativeTypes
  - LambdaCase
  - LexicalNegation
  - LiberalTypeSynonyms
  - MagicHash
  - MonadComprehensions
  - MultiWayIf
  - NoMonomorphismRestriction
  - NoStarIsType
  - NumDecimals
  - OverloadedLabels
  - OverloadedLists
  - OverloadedRecordDot
  - OverloadedStrings
  - PackageImports
  - ParallelListComp
  - PartialTypeSignatures
  - PatternSynonyms
  - QualifiedDo
  - QuantifiedConstraints
  - QuasiQuotes
  - RebindableSyntax
  - RecordWildCards
  - RecursiveDo
  - RoleAnnotations
  - StaticPointers
  - TemplateHaskell
  - TransformListComp
  - TypeFamilyDependencies
  - UnboxedTuples
  - UnliftedDatatypes
  - UnliftedNewtypes
  - ViewPatterns
  # - AllowAmbiguousTypes
  # - CApiFFI
  # - DeepSubsumption
  # - ExtendedLiterals
  # - GHCForeignImportPrim
  # - InterruptibleFFI
  # - LinearTypes
  # - OverloadedRecordUpdate
  # - RequiredTypeArguments
  # - Safe
  # - Strict
  # - TypeAbstractions
  # - TypeData
  # - UndecidableInstances
  # - UndecidableSuperClasses
  # - UnliftedFFITypes

dependencies:
  - arithmoi # partial package
  - array # partial package
  - arrows # partial package
  - base
  - bifunctors # partial package
  - bytestring # should not be required in lib
  - comonad # partial package
  - containers
  - contravariant # partial package
  - dlist # partial package
  - either # partial package
  - hashable
  - heap
  - indexed-traversable # partial package
  - lens
  - mmorph # partial package
  - modern-uri
  - monoid-subclasses # partial package
  - mtl
  - pathtype
  - profunctors # partial package
  - random # partial package
  - random-shuffle # partial package
  - regex
  - regex-applicative
  - safe-exceptions
  - scientific # partial package
  - selective # partial package
  - semigroupoids # partial package
  - semigroups # partial package
  - string-interpolate # partial package
  - tagged # partial package
  - text
  - these # partial package
  - thyme # revisit this
  - transformers
  - unliftio
  - unordered-containers
  - uuid
  - vector
  - witherable # partial package
  # - free # try removing this
  # - categories # partial package
  # - data-category # partial package
  # - group-theory # partial package
  # - invertible # partial package
  # - magmas # partial package
  # - mono-traversable # partial package
  # - permutation # partial package
  # - red-black-tree # partial package
  # - rose-trees # partial package
  # - rose-trie # partial package
  # - tries # partial package

library:
  source-dirs: src
  when:
    - condition: false
      other-modules: Paths_lib
```

## Software Project Configuration
- Editorconfig
- Git
-- Ignores
-- Hooks
-- Attributes
- Justfile
- Testing
- Coverage
- Profiling
- Benchmarking
- Linter
- Formatter

## Backend
- Language multithreaded - concurrency & parallelism
-- Coroutine
-- Reactive, Event driven and event loop
- Dockerization
- Project architecture
-- Interface and domain objects / Model
-- Module / packages structure
- Dependency injection
- SOLID - Design principle
- Error handling
- ApM / Instrumentation - application  monitoring
-- Logging
-- Metrics / Alerting
- Identity & access management
- CI & CD
- RDBMS
-- Schema design / Normalization & Denormalization
-- Indexes, constraint, partitioning & foreign key
-- ACID and transactions
-- Transaction isolation level
-- OLAP & OTAP
-- SQL & NoSQL
- Caching - reddis
- Micro-service / Distributed system and there nuances
-- CAP Theorem
-- Kubernetes
-- Tracing
- Queue service & event streaming (kafka)
- Encoding & decoding
- Encryption & decryption - symmetric & asymmetric
- Hashing
- Signing & unsigning
- Serialization & De-serialisation
- Api Design
-- REST vs RPC(GRPC) vs Graphql
-- Webhook vs web socket vs http streaming
-- Pagination - cursor based vs offset based
-- Rate limiting - Laguna aur use karma (client side , server side)
-- Multitenancy / partation
- Linux terminal commands
- Design Pattern
- Basic Functional programming
- Workflow manager - temporal
