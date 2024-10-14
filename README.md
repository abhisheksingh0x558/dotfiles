# Dotfiles

## WIP
- [ ] Enable git maintainence for all repos
- [ ] Update emacs, neovim, zsh plugins with justfile
- [ ] Telescope fix height
- [ ] Consult extensions
- [ ] Enable autocompletion doc popup
- [ ] See if telescope supports fzf syntax otherwise remove it
- [ ] Setup zsh lang support
- [ ] Defer with leaf
- [ ] Emacs highlight with treesitter
- [ ] Fix emacs formatter for elisp
- [ ] Fix noevim gq (format) binding
- [ ] Use telescope to show commands
- [ ] Enable spell and grammar check for commits and code and comments
- [ ] Setup M-x and : keybindings both for emacs and neovim
- [ ] Move macos brew casks and nixos system guis to common user.nix file
- [ ] Remove as many external neovim plugins and emacs packages as possible

- [ ] add named directories

**General**
- [ ] fzf keymaps
- [ ] fzf ordering
- [ ] telescope show hidden files
- [ ] git lfs
- [ ] git merge multiple repos
- [ ] git smudge and clean filters
- [ ] git attributes
- [ ] git diff ignore whitespace and enable word diff

**Neovim/Emacs**
- [ ] manage scratch buffers
- [ ] manager terminals and repls
- [ ] breadcrumbs
- [ ] git blame mappings
- [ ] completion previous both in in-buffer and mini-buffer modes
- [ ] Add LSP capabilities for neovim blink.cmp and lsp-snippet for emacs
- [ ] Add autocompletion to terminals
- [ ] Auto add bracets to autocompleted functions/methods

**Emacs**
- [ ] marginalia
- [ ] embark
- [ ] projectile
- [ ] ein
- [ ] dabbrev
- [ ] corfu-history
- [ ] eldoc-mode
- [ ] eglot-mode
- [ ] repeat-mode
- [ ] dape-mode
- [ ] fido-vertical-mode
- [ ] icomplete-vertical-mode
- [ ] herculus

**Pending Commits**
- [ ] feat(user.common.neovim): add github client
- [ ] feat(user.common.neovim): add session manager
- [ ] feat(user.common.neovim): add ai integration
~~- [ ] feat(user.common.neovim): add proto support~~
~~- [ ] feat(user.common.neovim): add kotlin support~~
- [x] feat(user.common.neovim): add rust support
- [x] feat(user.common.neovim): add go support
- [x] feat(user.common.neovim): add haskell support
~~- [ ] feat(user.common.neovim): add nu support~~
- [x] feat(user.common.neovim): add nix support
~~- [ ] feat(user.common.neovim): add fennel support~~
- [ ] feat(user.common.neovim): add pkm tool
- [ ] feat(user.common.neovim): add debugger
- [ ] feat(user.common.neovim): add notebook runner
- [x] feat(user.common.neovim): add repl runner
- [x] feat(user.common.neovim): add code runner
- [ ] feat(user.common.neovim): add test runner
- [ ] feat(user.common.neovim): add task runner
- [ ] feat(user.common.neovim): add outliner
- [ ] feat(user.common.neovim): add project manager
- [ ] feat(user.common.neovim): add filesystem manager
- [x] feat(user.common.neovim): add terminal manager
- [ ] feat(user.common.neovim): add folding
- [x] feat(user.common.neovim): add linter
- [x] feat(user.common.neovim): add formatter
- [ ] feat(user.common.neovim): add refactoring
- [x] feat(user.common.neovim): add lsp integration
- [x] feat(user.common.neovim): add treesitter integration
- [x] feat(user.common.neovim): add git integration
- [x] feat(user.common.neovim): add autocompletion
- [x] feat(user.common.neovim): add fuzzy finder
- [x] feat(user.common.neovim): improve ui and ux
- [x] feat(user.common.neovim): add keymaps
- [x] feat(user.common.neovim): adjust code style
- [x] feat(user.common.emacs): add haskell support
- [x] feat(user.common.emacs): add nix support
- [x] feat(user.common.emacs): add formatter
- [x] feat(user.common.emacs): add treesitter integration
- [x] feat(user.common.emacs): add git integration
- [x] feat(user.common.emacs): add autocompletion
- [x] feat(user.common.emacs): add fuzzy finder
- [x] feat(user.common.emacs): improve ui and ux
- [x] feat(user.common.emacs): add keymaps
- [x] feat(user.common.emacs): adjust code style
- [x] feat(user.common.neovim): install neovim
- [x] feat(user.common.emacs): install emacs
- [x] feat(user.common.brave): install brave

**Emacs flake**
```
# Keymaps
# Vi layer
evil-surround # Manipulate surrounding pairs
evil-exchange # Exchange operator
evil-lion # Manipulate alignments
# TODO: Check if this is required
evil-snipe # Navigate with search labels

# UI/UX
doom-themes # Theme
nerd-icons # Icons
doom-modeline # Modeline
dashboard # Dashboard
highlight-indent-guides # Indentation guides
# TODO: Check if this is possilbe via treesitter
hl-todo # Highlight todo comments
rainbow-delimiters # Highlight brackets

# Treesitter integration
treesit-grammars.with-all-grammars # Language grammars
tree-sitter-langs # Language queries

# Nix support
# TODO: Merge this in upstream emacs and remove from here
nix-mode

# Haskell support
# TODO: Merge this in upstream emacs and remove from here
haskell-mode
```

**Neovim config**
```

[;;; Command line
 ;; Command line prefix history search
 [:c :<c-k> :<up>]
 [:c :<c-j> :<down>]
 ;;; Terminal
 ;; Switch from terminal mode to normal mode
 [:t :<esc> "<c-\\><c-n>"]
 ;; Send escape key to program running in terminal buffer
 [:t "<c-\\><c-n>" :<esc>]]
```

```
[;;; UI/UX
 ;; Indentation guides
 {:name :ibl
  :setup {;; Disable treesitter scope indicator
          :scope {:enabled false}
          ;; Disable indentation guides for specific files
          :exclude {:filetypes [:dashboard]}}}
 ;; UI for messages, cmdline, and popupmenu
 {:name :notify
  :setup {:on_open (lambda [win]
                     (vim.api.nvim_win_set_config win {:focusable false}))}}
 {:name :noice :setup {:cmdline {:view :cmdline} :messages {:view :mini}}}
 ;; Window layout manager
 ;; TODO: Enable this
 ;; {:name :focus
 ;;  :post-hook (lambda [_]
 ;;               (vim.api.nvim_create_autocmd :FileType
 ;;                                            {:group (vim.api.nvim_create_augroup :focus
 ;;                                                                                 {})
 ;;                                             :callback (lambda []
 ;;                                                         (set vim.b.focus_disable
 ;;                                                              (vim.tbl_contains focus-ignore-filetypes
 ;;                                                                                vim.bo.filetype)))}))}
 ;;; Fuzzy finder
 {:name :telescope
  :keymaps [;; Find buffer
            [:n :<leader><tab> (telescope-find :buffers)]
            ;; Find recent files
            [:n :<leader><bs> (telescope-find :oldfiles)]
            ;; Search project files
            [:n :g/ (telescope-find :live_grep)]
            ;; Find projects
            [:n :<leader>p (telescope-find :projects :projects)]]}
 ;;; Autocompletion
 ;; Snippet engine
 {:name :snippets :setup {:create_cmp_source true :friendly_snippets true}}
 {:name :cmp
  :setup (lambda [cmp]
           {:sources (cmp.config.sources [;; LSP autocompletion source
                                          {:name :nvim_lsp}
                                          ;; Snippet autocompletion source
                                          {:name :snippets}
                                          ;; Filesystem path autocompletion source
                                          {:name :path}]
                                         [;; Buffer autocompletion source
                                          {:name :buffer}])})
  :post-hook (lambda [cmp]
               (cmp.setup.cmdline ":"
                                  {:sources (cmp.config.sources [;; Filesystem path autocompletion source
                                                                 {:name :path}
                                                                 ;; Command-line autocompletion source
                                                                 {:name :cmdline}])
                                   :mapping (cmp.mapping.preset.cmdline)})
               (cmp.setup.cmdline ["/" "?"]
                                  {:sources (cmp.config.sources [;; Buffer autocompletion source
                                                                 {:name :buffer}])
                                   :mapping (cmp.mapping.preset.cmdline)}))}
 ;;; VCS integration
 ;; Git commands in buffer
 {:name :gitsigns
  :setup {:on_attach (lambda [buffer]
                       (hunk-jump "[c" :prev buffer)
                       (hunk-jump "]c" :next buffer)
                       (hunk-jump "[C" :first buffer)
                       (hunk-jump "]C" :last buffer))}}
 ;; Resolve merge conflicts
 :git-conflict
 ;;; Treesitter integration
 {:name :nvim-treesitter.configs
  :setup {;; Syntax highlighting
          :highlight {:enable true}
          ;; Incremental text object selection
          :incremental_selection {:enable true}
          ;; Indentation
          :indent {:enable true}
          ;; Treesitter text objects
          :textobjects {:select {:enable true}
                        :swap {:enable true}
                        :move {:enable true}
                        :lsp_interop {:enable true}}
          ;; Manipulate tag pairs
          :pairs {:enable true}}}
 ;; Manipulate tag pairs
 :nvim-ts-autotag
 ;; Manipulate S-expressions
 :treesitter-sexp
 ;; Paredit implementation for neovim
 :nvim-paredit
 ;;; LSP integration
 {:name :lspconfig
  :setup false
  :post-hook (lambda [lsp]
               (let [languages (require :language)
                     cmp (require :cmp_nvim_lsp)
                     capabilities (cmp.default_capabilities)]
                 (each [_ options (pairs languages)]
                   (when options.server
                     ((. lsp options.server :setup) {: capabilities})))))}
 ;;; Refactoring
 :refactoring
 :inc_rename
 ;;; Formattor
 {:name :conform
  :setup (let [languages (require :language)]
           {:format_after_save {}
            :formatters_by_ft (collect [language options (pairs languages)]
                                (values language options.formatters))})
  :options {:formatexpr "v:lua.require'conform'.formatexpr()"}}
 ;;; Linter
 {:name :lint
  :setup false
  :post-hook (lambda [lint]
               (let [languages (require :language)]
                 (each [language options (pairs languages)]
                   (set (. lint :linters_by_ft language) options.linters))
                 (vim.api.nvim_create_autocmd [:BufWritePost
                                               :BufReadPost
                                               :InsertLeave]
                                              {:group (vim.api.nvim_create_augroup :linting
                                                                                   {})
                                               :callback (lambda []
                                                           (lint.try_lint))})))}
 ;;; Folding
 {:name :ufo
  :setup {:provider_selector (lambda [] [:treesitter :indent])}
  :options {:foldcolumn :1 :foldlevel 99 :foldlevelstart 99 :foldenable true}
  :keymaps (lambda [ufo] [[:n :zR ufo.openAllFolds] [:n :zM ufo.closeAllFolds]])}
 ;;; PKM tool
 {:name :neorg :setup {:load {:core.defaults {} :core.concealer {}}}}
 ;; Github client
 {:name :octo :setup {:default_to_projects_v2 true}}]
```

**Neovim flake**
```
# Keymaps
unimpaired-nvim # Pairs of bracket keymaps
comment-nvim # Manipulate comments
nvim-surround # Manipulate surrounding pairs
substitute-nvim # Exchange operator
text-case-nvim # Manipulate text cases
align-nvim # Manipulate alignments
dial-nvim # Increment and decrement operator
treesj # Split and join operator
nvim-gomove # Move and duplicate block operator
flash-nvim # Navigate with search labels
grug-far-nvim # Find and replace
nvim-various-textobjs # Text objects
neogen # Annotation generator
other-nvim # Alternative files
scretch-nvim # Scratch files

# UI/UX
nvim-web-devicons # Icons
tabby-nvim # Tabline
feline-nvim # Statusline
dashboard-nvim # Dashboard
indent-blankline-nvim # Indentation guides
nui-nvim # UI component library
noice-nvim # UI for messages, cmdline, and popupmenu
trouble-nvim # UI for diagnostics, references, telescope results, quickfix and location list
nvim-notify # UI for notifications
dressing-nvim # Improve UI defaults
# TODO: Check if this is possilbe via treesitter
todo-comments-nvim # Highlight todo comments
rainbow-delimiters-nvim # Highlight brackets
vim-illuminate # Highlight word under cursor
focus-nvim # Window layout manager
edgy-nvim # Window layout manager

# Autocompletion
nvim-snippets # Snippet engine
# TODO: Enable this
nvim-scissors # Manage snippets

# VCS integration
diffview-nvim # Cycle diffs

# Treesitter integration
nvim-treesitter.withAllGrammars # Language queries and grammars
nvim-treesitter-textobjects # Treesitter text objects
nvim-treesitter-textsubjects # Treesitter context aware text objects
nvim-ts-autotag # Manipulate tag pairs
nvim-treesitter-pairs # Manipulate pair objects
nvim-treesitter-context # Cursor context
nvim-treesitter-sexp # Manipulate S-expressions
nvim-ts-context-commentstring # Manipulate comments
nvim-paredit # Paredit implementation for neovim

# LSP integration
nvim-lspconfig
none-ls-nvim

# Refactoring
# TODO: Enable this
nvim-treesitter-refactor
refactoring-nvim
inc-rename-nvim

# Folding
nvim-ufo

# Filesystem manager
neo-tree-nvim # Explorer in sidebar
oil-nvim # Explorer in buffer
nvim-genghis # Commands for managing files and directories

# Project manager
project-nvim

# Outliner
aerial-nvim

# Task runner
overseer-nvim

# Test runner
neotest

# REPL runner
# conjure # TODO: Enable this

# Notebook runner
molten-nvim

# Debugger
nvim-dap
nvim-dap-ui
nvim-dap-virtual-text

# PKM tool
neorg

# AI integration
# TODO: Enable this
# avante-nvim

# Session manager
persistence-nvim

# Github client
octo-nvim
```

## TODOs
- [ ] Fix vim global issue
- [ ] Difftastic as core.pager, diff.external, diff.tool, difftool.prompt, pager.difftool, interactive.diffFilter
- [ ] Use emacs and neovim daemon
- [ ] Setup starship, carapace, thefuck, zoxide, fzf for nushell
- [ ] Track xdg files on nixos and macos
- [ ] Install luajit and elisp
- [ ] Install gh
- [ ] Disable ligatures for wezterm
- [ ] Use pre-commit with treefmt and something similar for linting
- [ ] Use brave.nix, substituter.nix, emacs.nix, neovim.nix

###  General
- [ ] Zsh, emacs, neovim filter history
- [ ] Setup treesitter, lsp, linter, formatter, ts indentor, inc selector, ts text object, refactor, repl, snippet runner, command runner
- [ ] Setup haskell, purescript, scala, rust
- [ ] Setup common lisp, clojurescript, clojure, racket
- [ ] Setup zig, typescript, kotlin, go
- [ ] Setup julia, typest, python, javascript
- [ ] Setup markdown, latex, proto, json, yaml, toml, scss, SQL
- [ ] Switch to codeberg, mastadon, signal, matrix (element)
- [ ] Track neovim, emacs, and zsh lockfiles
- [ ] Pin neovim, emacs, and zsh plugins
- [ ] Lazy load zsh plugins
- [ ] Bytecompile lua, zsh and elisp
- [ ] Use ZDOTDIR
- [ ] Reformat and add comments to karabiner.json and hardware.nix
- [ ] Use fast-tags for haskell, and other tags for other langs
- [ ] Increase timeout for starship
- [ ] Auto link emacs application on macos
- [ ] Fix dotfiles project structure
- [ ] Disable neovim font level in gutter
- [ ] Disable neovim todo hints in gutter
- [ ] Emacs put nerd-icon-install-fonts into init.el
- [ ] Remove overlays
- [ ] Fix justfile
- [ ] Install file watchers for all languages
- [ ] Do not install zsh and nushell from home manager
- [ ] Use nushell on linux and zsh on macos and bash for nix envs
- [ ] Use isDarwin, isArch, flake-parts, and devenv
- [ ] Home manager overrides
- [ ] Enable XDG for both macos and nixos specially for nushell and zsh
- [ ] Install and manage xcode cmdline tools and homebrew by home manager instead of nix darwin
- [ ] Check if root is required for nix trusted users or is added by default
- [ ] Enable homebrew autoupdate and other options
- [ ] Add location and i18n and console settings by referring to nixos configuration
- [ ] Check if https://cache.nixos.org/ is added to substituters on nixos and macos, and also enable cachix
- [ ] Enable line numbering and syntax highlight on git-delta
- [ ] Add github read:project token via nix
- [ ] Copy nixos system setting to macos system settings
- [ ] Track scroll settings for macos and nixos
- [ ] Check if substituters are required by home manager and nix darwin
- [ ] Check cmdline completion via noice/nvim-cmp
- [ ] Split large neovim and emacs commits and configure conventional commits modules and add module scope to existing commits
- [ ] Install git flow and conventional commits
- [ ] Add script to clone all github repos
- [ ] Add script to delete all merged branches
- [ ] Remove cosmic default applications
- [ ] Make brave, neovim and wezterm (with zellij) as default programs
- [ ] Extract fonts, themes, etc. to config file for all terminals, etc.
- [ ] Install debug adapters for all languages
- [ ] Install test suites for all languages
- [ ] Enable nushell integration for zellij
- [ ] Configure pre commit hooks
- [ ] Check nixos installation instructions in apple notes and document it in dotfiles
- [ ] Highlight injected sql
- [ ] Make brave, alacritty, etc transparent
- [ ] Rename boot loader
- [ ] Since nix store is world readable, encrypt secure files in it
- [ ] Encrypt netrc
- [ ] Use age/sops/git crypt/bitwarden/keybase
- [ ] Validate if no secrets were commited to dotfiles repo ever
- [ ] Enable commit signing, tag signing, push signing
- [ ] Install mail client, rss feed reader, iirc, matrix, discord, slack, etc. clients
- [ ] Migrate to neovim 0.11 native lsp config, completion, native snippet engine, only use snippets templates
- [ ] Migrate to neovim terminal, project manager, file explorer, formatter, folder, linter and any other native features
- [ ] Migrate to cosmic once it is stable
- [ ] Migrate to emacs tempel from yasnippet once it is stable

### Emacs languages
- [ ] Bash/Sh
- [ ] C
- [ ] C++
- [ ] CSS
- [ ] Clojure
- [ ] Common Lisp
- [ ] Conf/Gitconf
- [ ] Docker/compose
- [ ] Elisp
- [ ] Go
- [ ] HTML
- [ ] Haskell
- [ ] Java
- [ ] Javascript
- [ ] Json
- [ ] Julia
- [ ] Justfile
- [ ] Kotlin
- [ ] Latex
- [ ] Lua
- [ ] Makefile
- [ ] Markdown
- [ ] Neorg
- [ ] Nix
- [ ] Nu
- [ ] Obsidian
- [ ] Org
- [ ] Proto
- [ ] Purescript
- [ ] Python
- [ ] Racket
- [ ] Regex
- [ ] Rust
- [ ] Sass
- [ ] Scheme
- [ ] Scss
- [ ] Sql with dialects
- [ ] Terraform/terragrunt
- [ ] Toml
- [ ] Typescript
- [ ] Typst
- [ ] XML
- [ ] Yaml
- [ ] Zig
- [ ] Zsh

### Neovim languages
- [ ] Bash/Sh
- [ ] C
- [ ] C++
- [ ] CSS
- [ ] Clojure
- [ ] Scala
- [ ] Common Lisp
- [ ] Conf/Gitconf
- [ ] Docker/compose
- [ ] Elisp
- [ ] Go
- [ ] HTML
- [ ] Haskell
- [ ] Java
- [ ] Javascript
- [ ] Json
- [ ] Julia
- [ ] Justfile
- [ ] Kotlin
- [ ] Latex
- [ ] Lua
- [ ] Makefile
- [ ] Markdown
- [ ] Neorg
- [ ] Nix
- [ ] Nu
- [ ] Obsidian
- [ ] Org
- [ ] Proto
- [ ] Purescript
- [ ] Elm
- [ ] Python
- [ ] Racket
- [ ] Regex
- [ ] Rust
- [ ] Sass
- [ ] Scheme
- [ ] Scss
- [ ] Sql with dialects
- [ ] Terraform/terragrunt
- [ ] Toml
- [ ] Typescript
- [ ] Typst
- [ ] XML
- [ ] Yaml
- [ ] Zig
- [ ] Zsh

### Themes
- [ ] Brave
- [ ] Emacs
- [ ] Neovim
- [ ] Zellij
- [ ] Alacritty
- [ ] Hyprland
- [ ] Waybar
- [ ] Fzf
- [ ] Bat
- [ ] Lazygit
- [ ] Rofi
- [ ] Starship
- [ ] Nushell
- [ ] Difftastic
- [ ] Neovim feline
- [ ] Neovim tabby
- [ ] Cosmic
- [ ] Firefox
- [ ] Wezterm

### Neovim plugins
- [ ] Package managers like hotpot, lazyvim
- [ ] nvim-lsp-selection-range
- [ ] nvim-spyder
- [ ] multicursors.nvim
- [ ] Yanky
- [ ] Marks
- [ ] Undos
- [ ] Jumps
- [ ] Changes
- [ ] Harpoon
- [ ] Arrow
- [ ] Transient mode
- [ ] Rainbow mode for CSS
- [ ] PKM tools - obsidian, roam, etc.
- [ ] Git clouding hosting site integration
- [ ] Avante
- [ ] Parrot

### Emacs packages
- [ ] Combobulate
- [ ] goto-chg.el
- [ ] no-littering
- [ ] lsp-booster
- [ ] dump-jump
- [ ] multicursors
- [ ] hippie-expand
- [ ] Try
- [ ] Snippets
- [ ] Auto pairs
- [ ] Autocompletion
- [ ] VCS
- [ ] Treesitter plugins
- [ ] LSP tools
- [ ] Refactoring tools
- [ ] Linter
- [ ] Folding - Origami
- [ ] Terminal manager
- [ ] Filesystem manager - sidebar and buffer
- [ ] Project manager
- [ ] Code outliner
- [ ] Task runner
- [ ] Test runner
- [ ] Code runner
- [ ] REPL runner
- [ ] Debugger
- [ ] PKM tools - obsidian, roam, etc.
- [ ] AI integration
- [ ] Session manager
- [ ] Text case
- [ ] Inc/Dec operator
- [ ] Split join
- [ ] Move/duplicate operator
- [ ] Find and replace
- [ ] Text objects plain and treesitter based
- [ ] Annotation generator
- [ ] Alternate files
- [ ] Scratch files
- [ ] Transient mode
- [ ] Rainbow mode
- [ ] Icons
- [ ] Tabline
- [ ] Statusline
- [ ] UI components
- [ ] Highlight word under cursor
- [ ] Virtual text to discover motions
- [ ] Window layout manager
- [ ] Yanky
- [ ] Marks
- [ ] Undos
- [ ] Jumps
- [ ] Changes
- [ ] Harpoon
- [ ] Arrow
- [ ] Git clouding hosting site integration
- [ ] Forge
- [ ] Jinx
- [ ] Taskrunner
- [ ] Persp
- [ ] Eat
- [ ] Avy
- [ ] Flycheck
- [ ] Gptel
- [ ] Elysium

### Neovim improvments
- [ ] Fix neogit tab handling
- [ ] Fix telescope theme with dressing
- [ ] Add conflict marker mappings
- [ ] Fix neogit log buffer top line issue
- [ ] Fugitive with cloud integrations
- [ ] Targets
- [ ] Lion
- [ ] Render markdown
- [ ] Fix neogit rebase modify
- [ ] Fix neogit char wise diff
- [ ] Check paredit, parinfer, vim-sexp vs nvim-treesitter-sexp
- [ ] Check if refactoring plugings are required

NixOS MacBook Installation
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

Nix MacOS Installation
1. Install via determinate installer
2. Install Xcode command line tools
3. Install homebrew
4. chpass -s /run/current-system/sw/bin/nu
5. Set default browser to brave from settings
6. Generate ssh keys
7. NOT REQUIRED - Track /etc/nix/nix.conf
