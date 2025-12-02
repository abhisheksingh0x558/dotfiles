(require 'evil)

(evil-define-key 'normal 'global
  "]q" #'next-error ; Go to next error or xref entry
  "[q" #'previous-error) ; Go to previous error or xref entry

(provide 'my-pkg-lint)
