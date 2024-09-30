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
