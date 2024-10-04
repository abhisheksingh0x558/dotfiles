(local vim _G.vim)

(local focus-ignore-filetypes [;; Quickfix list
                               :qf
                               ;; Diffview panel
                               :DiffviewFiles
                               ;; Neotree filesystem explorer
                               :neo-tree])

(local telescope-extensions [;; Fzf file sorter
                             :fzf
                             ;; Project manager
                             :projects])

(lambda telescope-find [action ?extension]
  (let [extension (or ?extension false)
        telescope (require :telescope)
        builtin (require :telescope.builtin)
        namespace (if extension (. telescope :extensions extension) builtin)]
    (. namespace action)))

(lambda hunk-jump [key direction buffer]
  (let [gitsigns (require :gitsigns)]
    (vim.keymap.set :n key
                    (lambda []
                      (if (and vim.wo.diff
                               (or (= direction :prev) (= direction :next)))
                          (vim.cmd.normal key {:bang true})
                          (gitsigns.nav_hunk direction {: buffer}))))))

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
            [:n :g/ (telescope-find :live_grep)]
            ;; Find projects
            [:n :<leader>p (telescope-find :projects :projects)]]}
 ;;; Autocompletion
 ;; Autocomplete brackets, quotes, etc.
 :nvim-autopairs
 ;; Snippet engine
 {:name :snippets :setup {:create_cmp_source true :friendly_snippets true}}
 {:name :cmp
  :setup (lambda [cmp]
           {:sources (cmp.config.sources [;; LSP autocompletion source
                                          {:name :nvim_lsp}
                                          ;; Snippet autocompletion source
                                          {:name :snippets}
                                          ;; Filesystem path autocompletion source
                                          {:name :path}]
                                         [;; Buffer autocompletion source
                                          {:name :buffer}])
            :mapping (cmp.mapping.preset.insert {:<tab> (cmp.mapping.confirm {:select true})
                                                 :<cr> (cmp.mapping.confirm {:select true})})})
  :post-hook (lambda [cmp]
               (cmp.setup.cmdline ":"
                                  {:sources (cmp.config.sources [;; Filesystem path autocompletion source
                                                                 {:name :path}
                                                                 ;; Command-line autocompletion source
                                                                 {:name :cmdline}])
                                   :mapping (cmp.mapping.preset.cmdline)})
               (cmp.setup.cmdline ["/" "?"]
                                  {:sources (cmp.config.sources [;; Buffer autocompletion source
                                                                 {:name :buffer}])
                                   :mapping (cmp.mapping.preset.cmdline)}))}
 ;;; VCS integration
 ;; Git commands in buffer
 {:name :gitsigns
  :setup {:on_attach (lambda [buffer]
                       (hunk-jump "[c" :prev buffer)
                       (hunk-jump "]c" :next buffer)
                       (hunk-jump "[C" :first buffer)
                       (hunk-jump "]C" :last buffer))}}
 ;; Git client
 {:name :neogit :keymaps (lambda [neogit] [[:n :<leader>g neogit.open]])}
 ;; Resolve merge conflicts
 :git-conflict
 ;;; Treesitter integration
 {:name :nvim-treesitter.configs
  :setup {;; Syntax highlighting
          :highlight {:enable true}
          ;; Incremental text object selection
          :incremental_selection {:enable true}
          ;; Indentation
          :indent {:enable true}
          ;; Treesitter text objects
          :textobjects {:select {:enable true}
                        :swap {:enable true}
                        :move {:enable true}
                        :lsp_interop {:enable true}}
          ;; Manipulate tag pairs
          :pairs {:enable true}}}
 ;; Manipulate tag pairs
 :nvim-ts-autotag
 ;; Manipulate S-expressions
 :treesitter-sexp
 ;; Paredit implementation for neovim
 :nvim-paredit
 ;;; LSP integration
 {:name :lspconfig
  :setup false
  :post-hook (lambda [lsp]
               (let [languages (require :language)
                     cmp (require :cmp_nvim_lsp)
                     capabilities (cmp.default_capabilities)]
                 (each [_ options (pairs languages)]
                   (when options.server
                     ((. lsp options.server :setup) {: capabilities})))))}
 ;;; Refactoring
 :refactoring
 :inc_rename
 ;;; Formattor
 {:name :conform
  :setup (let [languages (require :language)]
           {:format_after_save {}
            :formatters_by_ft (collect [language options (pairs languages)]
                                (values language options.formatters))})
  :options {:formatexpr "v:lua.require'conform'.formatexpr()"}}
 ;;; Linter
 {:name :lint
  :setup false
  :post-hook (lambda [lint]
               (let [languages (require :language)]
                 (each [language options (pairs languages)]
                   (set (. lint :linters_by_ft language) options.linters))
                 (vim.api.nvim_create_autocmd [:BufWritePost
                                               :BufReadPost
                                               :InsertLeave]
                                              {:group (vim.api.nvim_create_augroup :linting
                                                                                   {})
                                               :callback (lambda []
                                                           (lint.try_lint))})))}
 ;;; Folding
 {:name :ufo
  :setup {:provider_selector (lambda [] [:treesitter :indent])}
  :options {:foldcolumn :1 :foldlevel 99 :foldlevelstart 99 :foldenable true}
  :keymaps (lambda [ufo] [[:n :zR ufo.openAllFolds] [:n :zM ufo.closeAllFolds]])}
 ;;; Terminal manager
 {:name :toggleterm
  :keymaps (lambda [toggleterm] [[:n :<leader>t toggleterm.toggle_command]])}
 ;;; Filesystem manager
 ;; Explorer in sidebar
 {:name :neo-tree
  :keymaps (lambda [_]
             (let [command (require :neo-tree.command)]
               [[:n :<leader>e (lambda [] (command.execute {:toggle true}))]]))}
 ;; Explorer in buffer
 :oil
 ;;; Project manager
 :project_nvim
 ;;; Outliner
 :aerial
 ;;; Task runner
 :overseer
 ;;; Test runner
 :neotest
 ;;; Code runner
 :sniprun]
