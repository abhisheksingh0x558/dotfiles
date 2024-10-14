;; -*- lexical-binding: t; -*-

(require 'package)
(require 'cus-edit)
(require 'use-package-core)
(require 'use-package-ensure)
(require 'treesit)

;;; Package manager
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) ; Add melpa as package repository
;; Package customizations
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
(setq use-package-always-ensure t) ; Automatically install packages

;;; Path
;; TODO: Add de-duplication
(setenv "PATH" (concat (expand-file-name "~/.nix-profile/bin:") (getenv "PATH"))) ; Add Nix to path
(add-to-list 'exec-path "~/.nix-profile/bin") ; Add Nix to path

;;; Code style
;; Editorconfig integration
(use-package editorconfig :config (editorconfig-mode))

;;; Keymaps
;; Vi layer
(use-package evil
  :custom
  (evil-want-keybinding nil) ; Do not set keymaps
  (evil-undo-system 'undo-redo) ; Keymap for redo
  :config
  (evil-mode)
  (evil-set-leader 'normal (kbd "SPC")) ; Leader key
  (evil-set-leader 'normal "\\" t)) ; Local leader key
(use-package evil-collection :config (evil-collection-init))
(evil-global-set-key 'normal (kbd "<leader>SPC") 'project-find-file) ; Find project files

;;; UI/UX
(setq inhibit-startup-screen t) ; Disable startup screen
(setq initial-scratch-message nil) ; Disable scratch buffer message
(global-display-line-numbers-mode) ; Enable line numbering
(global-hl-line-mode) ; Enable line highlighting
(setq evil-vsplit-window-right t) ; Put new window on right on vertical split
(setq evil-split-window-below t) ; Put new window on bottom on horizontal split
;; Theme
(use-package catppuccin-theme
  :custom (catppuccin-flavor 'mocha)
  :config (load-theme 'catppuccin :no-confirm))

;;; Autocompletion
(electric-pair-mode) ; Autoclose pairs
;; Mini-buffer completion UI
(use-package corfu
  :custom (corfu-auto t)
  :config (global-corfu-mode))

;;; Fuzzy finder
;; In-buffer completion UI
(use-package vertico :config (vertico-mode))

;;; VCS integration
;; Git client
(use-package magit
  :defer t
  :bind ("<leader>g" . magit)) ; Open git client

;;; Treesitter integration
;; Parsers to install
(setq treesit-language-source-alist
  '((nix "https://github.com/nix-community/tree-sitter-nix")
     (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (go "https://github.com/tree-sitter/tree-sitter-go")))
;; Treesitter major modes
(use-package nix-ts-mode :defer t)
(use-package haskell-ts-mode :defer t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))

;;; LSP integration
(use-package lsp-mode :defer t)
(use-package lsp-haskell :defer t)
;; Register language servers
(add-hook 'nix-ts-mode-hook #'lsp)
(add-hook 'haskell-ts-mode-hook #'lsp)
(add-hook 'rust-ts-mode-hook #'lsp)
(add-hook 'go-ts-mode-hook #'lsp)

;;; Formatter integration
(use-package apheleia
  :defer t
  :config
  (apheleia-global-mode)
  (add-to-list 'apheleia-formatters '(fourmolu . ("fourmolu" "--stdin-input-file" filepath)))
  (add-to-list 'apheleia-mode-alist '(nix-ts-mode . nixfmt))
  (add-to-list 'apheleia-mode-alist '(haskell-ts-mode . fourmolu))
  (add-to-list 'apheleia-mode-alist '(go-ts-mode . gofumpt)))
