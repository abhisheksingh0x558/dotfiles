(require 'evil)

(evil-define-key 'normal xref--xref-buffer-mode-map
  "j" #'xref-next-line ; Go to next xref entry
  "k" #'xref-prev-line) ; Go to previous xref entry

(provide 'my-pkg-ui)
