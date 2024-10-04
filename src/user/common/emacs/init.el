;; -*- lexical-binding: t; -*-

;;; Code style
(editorconfig-mode) ; Editorconfig integration

;;; Keymaps
;; Vi layer
(setq evil-want-keybinding nil)
(evil-mode)
(evil-collection-init)
(general-create-definer leader-definer :prefix "SPC")
(general-create-definer local-leader-definer :prefix "\\")

;;; UI/UX
;; Font
(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font-12"))
(load-theme 'doom-one t) ; Theme
(doom-modeline-mode 1) ; Modeline
;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(global-display-line-numbers-mode) ; Line numbering
(which-key-mode) ; Helper popup for keys

;;; Fuzzy finder
(vertico-mode)
(marginalia-mode)
(evil-global-set-key 'normal (kbd "<leader>spc") 'consult-fd)

;;; Autocompletion
(electric-pair-mode) ; Autocomplete brackets, quotes, etc.
(global-corfu-mode)
(setq corfu-auto t)

;;; VCS integration
;; Git client
(evil-global-set-key 'normal (kbd "<leader>g") 'magit)

;;; Treesitter integration
(use-package tree-sitter
  :config
  ;; TODO: Check if this is required
  (global-tree-sitter-mode)
  :hook
  ;; Syntax highlighting
  ;; TODO: Check if this is required and check other treesitter supported actions from neovim apart from hightlight
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
  ;; TODO: Do this in a better way
  (nix-ts-mode . eglot-ensure))

;;; Formatter
(apheleia-global-mode)
