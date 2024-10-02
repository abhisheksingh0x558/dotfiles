(local vim _G.vim)

(lambda snippet-jump [key direction]
  [[:i :s]
   key
   (if (vim.snippet.active {: direction})
       (vim.snippet.jump direction)
       key)
   {:expr true}])

[;;; Command line
 ;; Command line prefix history search
 [:c :<c-k> :<up>]
 [:c :<c-j> :<down>]
 ;;; Terminal
 ;; Switch from terminal mode to normal mode
 [:t :<esc> "<c-\\><c-n>"]
 ;; Send escape key to program running in terminal buffer
 [:t "<c-\\><c-n>" :<esc>]
 ;;; Snippet
 ;; Goto next snippet placeholder
 (snippet-jump :<tab> 1)
 ;; Goto previous snippet placeholder
 (snippet-jump :<s-tab> -1)]
