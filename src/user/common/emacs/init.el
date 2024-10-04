;; -*- lexical-binding: t; -*-

;;; Code style
(editorconfig-mode) ; Editorconfig integration

;;; Keymaps
;; Vi layer
(setq evil-want-keybinding nil)
(evil-mode)
(evil-collection-init)
(evil-set-leader 'normal (kbd " "))
(evil-set-leader 'normal (kbd "\\"))
