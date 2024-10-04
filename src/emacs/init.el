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
;; Nix treesitter mode
;; TODO: Merge this in upstream emacs and remove from here
(use-package nix-ts-mode
  :mode "\\.nix\\'")

;;; LSP integration
(use-package eglot
  :config
  ;; TODO: Do this in a better way
  (add-to-list 'eglot-server-programs
	       ;; Nix language server
	       ;; TODO: Check if this is required
	       '(nix-ts-mode "nil"))
  :hook
  ;; TODO: Check if this is required
  (nix-ts-mode . eglot-ensure))

;;; Formatter
(apheleia-global-mode)
