;; -*- lexical-binding: t; -*-

;;; Code style
(editorconfig-mode) ; Editorconfig integration

;;; Key mappings
;; TODO: Define leader and localleader keys
;; Vi layer
(setq evil-want-keybinding nil)
(evil-mode)
(evil-collection-init)

;;; UI/UX
;; Theme
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)
(global-display-line-numbers-mode) ; Line numbering
(which-key-mode) ; Helper popup for keys
(vertico-posframe-mode) ; UI for mini-buffer

;;; Fuzzy finder
(vertico-mode)
(marginalia-mode)
(evil-global-set-key 'normal (kbd "SPC SPC") 'consult-fd)

;;; Autocompletion
(electric-pair-mode) ; Autocomplete brackets, quotes, etc.
(global-corfu-mode)
(setq corfu-auto t)

;;; VCS integration
;; Git client
(evil-global-set-key 'normal (kbd "SPC g") 'magit)

;;; Treesitter integration
(use-package tree-sitter
  :config
  ;; TODO: Check if this is required
  (global-tree-sitter-mode)
  :hook
  ;; Syntax highlighting
  ;; TODO: Check if this is required
  (tree-sitter-mode . tree-sitter-hl-mode))
