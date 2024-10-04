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

