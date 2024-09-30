(local vim _G.vim)

(local focus-ignore-filetypes [;; Quickfix list
                               :qf])

(local telescope-extensions [;; Fzf file sorter
                             :fzf])

(lambda telescope-find [action ?extension]
  (let [extension (or ?extension false)
        telescope (require :telescope)
        builtin (require :telescope.builtin)
        namespace (if extension (. telescope :extensions extension) builtin)]
    (. namespace action)))

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
 ;; TODO: Enable this
 ;; {:name :focus
 ;;  :post-hook (lambda [_]
 ;;               (vim.api.nvim_create_autocmd :FileType
 ;;                                            {:group (vim.api.nvim_create_augroup :focus
 ;;                                                                                 {})
 ;;                                             :callback (lambda []
 ;;                                                         (set vim.b.focus_disable
 ;;                                                              (vim.tbl_contains focus-ignore-filetypes
 ;;                                                                                vim.bo.filetype)))}))}
 :edgy
 ;;; Fuzzy finder
 {:name :telescope
  :setup {:defaults {:layout_strategy :bottom_pane
                     :sorting_strategy :ascending}}
  :post-hook (lambda [telescope]
               (each [_ extension (ipairs telescope-extensions)]
                 (telescope.load_extension extension)))
  :keymaps [;; Find project files
            [:n :<leader><space> (telescope-find :find_files)]
            ;; Find buffer
            [:n :<leader><tab> (telescope-find :buffers)]
            ;; Find recent files
            [:n :<leader><bs> (telescope-find :oldfiles)]
            ;; Search project files
            [:n :g/ (telescope-find :live_grep)]]}]
