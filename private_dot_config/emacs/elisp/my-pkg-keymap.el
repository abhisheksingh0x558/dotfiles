(require 'evil)
(require 'evil-collection)
(require 'evil-commentary)
(require 'evil-surround)

;; Vi layer
(evil-mode)
(evil-set-leader 'normal (kbd "SPC")) ; Leader key
(evil-set-leader 'normal "\\" t) ; Local leader key
(evil-collection-init) ; Vi mappings across modes
(evil-commentary-mode) ; Manipulate comments
(global-evil-surround-mode) ; Manipulate surrounding pairs

(provide 'my-pkg-keymap)
