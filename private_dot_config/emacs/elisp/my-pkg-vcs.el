(require 'evil)

(evil-define-key 'normal 'global
  "]x" #'smerge-next ; Go to next conflict
  "[x" #'smerge-prev) ; Go to previous conflict

(evil-define-key 'normal smerge-mode-map
  "co" #'smerge-keep-upper ; Choose ours
  "ct" #'smerge-keep-lower ; Choose theirs
  "cb" #'smerge-keep-all ; Choose both
  "c0" #'smerge-keep-base) ; Choose none

(provide 'my-pkg-vcs)
