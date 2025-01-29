(macro defkey [mode key action]
  (if (= :string (type action))
      `(vim.keymap.set ,mode ,key ,action)
      `(vim.keymap.set ,mode ,key (lambda [] ,action))))

;; Command line prefix history search upward
(defkey :n :<C-k> :<Up>)
;; Command line prefix history search downward
(defkey :n :<C-j> :<Down>)
;; Switch from terminal mode to normal mode
(defkey :t :<Esc> "<C-\\><C-n>")
;; Send escape key to program running in terminal
(defkey :t "<C-\\><C-n>" :<Esc>)
;; Exchange current line with previous line TODO: Allow count, dot repeat and indent
(defkey :n :<M-k> "<Cmd>>move --<CR>>")
;; Exchange current line with next line TODO: Allow count, dot repeat and indent
(defkey :n :<M-j> "<Cmd>>move +<CR>>")
;; Exchange current line with previous line TODO: Allow count, dot repeat, indent, and goto last insert point
(defkey :i :<M-k> "<Cmd>>move --<CR>>")
;; Exchange current line with next line TODO: Allow count, dot repeat, indent, and goto last insert point
(defkey :i :<M-j> "<Cmd>>move +<CR>>")
;; Exchange current line with previous line TODO: Allow count, dot repeat, indent, and select last visual selection
(defkey :v :<M-k> "<Esc><Cmd>>'<,'>move '<--<CR>>")
;; Exchange current line with next line TODO: Allow count, dot repeat, indent, and select last visual selection
(defkey :v :<M-j> "<Esc><Cmd>>'<,'>move '>+<CR>>")
;; Goto previous error
(defkey :n "[e"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.ERROR
                        :count -vim.v.count1}))

;; Goto first error
(defkey :n "[E"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.ERROR
                        :count -vim._maxint
                        :wrap false}))

;; Goto last error
(defkey :n "]E"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.ERROR
                        :count vim._maxint
                        :warp false}))

;; Goto previous warning
(defkey :n "[w"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.WARN
                        :count -vim.v.count1}))

;; Goto next warning
(defkey :n "]w"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.WARN
                        :count vim.v.count1}))

;; Goto first warning
(defkey :n "[W"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.WARN
                        :count -vim._maxint
                        :warp false}))

;; Goto last warning
(defkey :n "]W"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.WARN
                        :count vim._maxint
                        :warp false}))

;; Goto previous info
(defkey :n "[i"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.INFO
                        :count -vim.v.count1}))

;; Goto next info
(defkey :n "]i"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.INFO
                        :count vim.v.count1}))

;; Goto first info
(defkey :n "[I"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.INFO
                        :count -vim._maxint
                        :warp false}))

;; Goto last info
(defkey :n "]I"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.INFO
                        :count vim._maxint
                        :warp false}))

;; Goto previous hint
(defkey :n "[h"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.HINT
                        :count -vim.v.count1}))

;; Goto next hint
(defkey :n "]h"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.HINT
                        :count vim.v.count1}))

;; Goto first hint
(defkey :n "[H"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.HINT
                        :count -vim._maxint
                        :warp false}))

;; Goto last hint
(defkey :n "]H"
  (vim.diagnostic.jump {:severity vim.diagnostic.severity.HINT
                        :count vim._maxint
                        :warp false}))

{}
