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
