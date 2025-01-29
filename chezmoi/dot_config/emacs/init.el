;; -*- lexical-binding: t; -*-

(require 'package)
(require 'cus-edit)
(require 'use-package-core)
(require 'use-package-ensure)

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
