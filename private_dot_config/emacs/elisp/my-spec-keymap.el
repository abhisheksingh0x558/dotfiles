;; Vi layer
'((evil
    :custom
    ((evil-want-keybinding . nil) ; Do not set key mappings
      (evil-undo-system . #'undo-redo))) ; Key mapping for redo
   (evil-collection
     :custom ((evil-collection-key-blacklist . '("]q" "[q")))) ; Disable key mappings
   evil-commentary ; Manipulate comments
   evil-surround ; Manipulate surrounding pairs
   evil-exchange ; Exchange text
   evil-string-inflection ; Manipulate text cases
   evil-snipe ; Navigate with search labels
   evil-lion) ; Manipulate alignments

(provide 'my-spec-keymap)
