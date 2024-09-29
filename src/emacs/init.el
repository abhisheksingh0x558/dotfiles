;; -*- lexical-binding: t; -*-

;;; Code style
(editorconfig-mode) ; Editorconfig integration

;;; Key mappings
;; Vi layer
(setq evil-want-keybinding nil)
(evil-mode)
(evil-collection-init)
(evil-set-leader 'normal (kbd " "))
(evil-set-leader 'normal (kbd "\\"))

;;; UI/UX
;; Font
(add-to-list 'default-frame-alist
	     '(font . "Fira Code Nerd Font-12"))
;; Theme
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)
(global-display-line-numbers-mode) ; Line numbering
(which-key-mode) ; Helper popup for keys
(vertico-posframe-mode) ; UI for mini-buffer

;;; Fuzzy finder
(vertico-mode)
(marginalia-mode)
(evil-global-set-key 'normal (kbd "<leader>spc") 'consult-fd)

;;; Autocompletion
(electric-pair-mode) ; Autocomplete brackets, quotes, etc.
(global-corfu-mode)
(setq corfu-auto t)
