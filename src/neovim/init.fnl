(local vim _G.vim)
(local g vim.g)
(local map vim.keymap.set)

(macro setup-package [package options]
  `(let [package# (require ,package)]
     (package#.setup ,(or options {}))))

;;; Code style
;; Editorconfig integration
(set g.editorconfig true)

;;; Key mappings
(set g.mapleader " ")
(set g.maplocalleader "\\")
(map :n :<a-x> ":")
;; Command-line prefix history search
(map :c :<c-k> :<up>)
(map :c :<c-j> :<down>)
;; Terminal
;; Switch from terminal mode to normal mode
(map :t :<esc> "<c-\\><c-n>")
;; Send escape key to program running in terminal buffer
(map :t "<c-\\><c-n>" :<esc>)
;; Snippet navigation
;; Goto next snippet placeholder
(map [:i :s] :<tab> (lambda []
                      (let [snippet vim.snippet]
                        (if (snippet.active {:direction 1})
                            (vim.snippet.jump 1)
                            :<tab>))) {:expr true})

;; Goto previous snippet placeholder
(map [:i :s] :<s-tab> (lambda []
                        (let [snippet vim.snippet]
                          (if (snippet.active {:direction -1})
                              (vim.snippet.jump -1)
                              :<tab>))) {:expr true})

;; Pairs of bracket key mappings
(setup-package :unimpaired)
;; Manipulate comments
(setup-package :Comment)
;; Manipulate surrounding pairs
(setup-package :nvim-surround)
;; Exchange operator
(setup-package :substitute)
;; Manipulate text cases
(setup-package :textcase)
;; Split and join operator
(setup-package :treesj)
;; Move and duplicate block operator
(setup-package :gomove)
;; Find and replace
(setup-package :grug-far)
;; Text objects
(setup-package :various-textobjs)
;; Annotation generator
(setup-package :neogen)
;; Alternative files
(setup-package :other-nvim)
;; Scratch files
(setup-package :scretch)

{}
