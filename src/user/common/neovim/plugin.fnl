(local vim _G.vim)

[;;; Keymaps
 ;; Pairs of bracket keymaps
 :unimpaired
 ;; Manipulate comments
 :Comment
 ;; Manipulate surrounding pairs
 :nvim-surround
 ;; Exchange operator
 :substitute
 ;; Manipulate text cases
 :textcase
 ;; Split and join operator
 :treesj
 ;; Move and duplicate block operator
 :gomove
 ;; Find and replace
 :grug-far
 ;; Text objects
 :various-textobjs
 ;; Annotation generator
 :neogen
 ;; Alternative files
 :other-nvim
 ;; Scratch files
 :scretch
 ;;; UI/UX
 ;; Icons
 :nvim-web-devicons
 ;; Tabline
 :tabby
 ;; Statusline
 :feline
 ;; Dashboard
 :dashboard
 ;; Indentation guides
 {:name :ibl
  :setup {;; Disable treesitter scope indicator
          :scope {:enabled false}
          ;; Disable indentation guides for specific files
          :exclude {:filetypes [:dashboard]}}}
 ;; UI for messages, cmdline, and popupmenu
 {:name :notify
  :setup {:on_open (lambda [win]
                     (vim.api.nvim_win_set_config win {:focusable false}))}}
 {:name :noice :setup {:cmdline {:view :cmdline} :messages {:view :mini}}}
 ;; UI for diagnostics, references, telescope results, quickfix and location list
 :trouble
 ;; Improve UI defaults
 :dressing
 ;; Highlight todo comments
 :todo-comments
 ;; Window layout manager
 :focus
 :edgy]
