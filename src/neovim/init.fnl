(local vim _G.vim)
(local g vim.g)
(local map vim.keymap.set)
(local cmd vim.cmd)
(local opt vim.opt)
(local api vim.api)

(macro setup-package [package options]
  `(let [package# (require ,package)]
     (package#.setup ,(or options {}))))

;;; Code style
;; Editorconfig integration
(set g.editorconfig true)

;;; Key mappings
(set g.mapleader " ")
(set g.maplocalleader "\\")
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

;;; UI/UX
;; Theme
(cmd.colorscheme :catppuccin-mocha)
;; Line numbering
(set opt.number true)
;; System clipboard
(set opt.clipboard :unnamedplus)
;; Smart seach
(set opt.ignorecase true)
(set opt.smartcase true)
;; Icons
(setup-package :nvim-web-devicons)
;; Tabline
(setup-package :tabby)
;; Statusline
(setup-package :feline)
;; Dashboard
(setup-package :dashboard)
;; Indentation guides
(setup-package :ibl {;; Disable treesitter scope indicator
                     :scope {:enabled false}
                     ;; Disable indentation guides for specific files
                     :exclude {:filetypes [:dashboard]}})

;; UI for messages, cmdline, and popupmenu
(setup-package :notify
               {:on_open (lambda [win]
                           (api.nvim_win_set_config win {:focusable false}))})

(setup-package :noice)
;; UI for diagnostics, references, telescope results, quickfix and location list
(setup-package :trouble)
;; UI for progress messages
(setup-package :fidget)
;; Improve UI defaults
(setup-package :dressing)
;; Highlight todo comments
(setup-package :todo-comments)
;; Window layout manager
(set opt.splitright true)
(set opt.splitbelow true)
;; (setup-package :focus)
(setup-package :edgy)

;;; Fuzzy finder
(let [telescope (require :telescope)
      extensions telescope.extensions
      builtin (require :telescope.builtin)
      themes (require :telescope.themes)
      theme (themes.get_dropdown {:previewer false})]
  ;; Fzf file sorter
  (telescope.load_extension :fzf)
  ;; Project manager
  (telescope.load_extension :projects)
  (map :n :<leader><space> (lambda [] (builtin.find_files theme)))
  (map :n :<leader><tab> (lambda [] (builtin.buffers theme)))
  (map :n :<leader><bs> (lambda [] (builtin.oldfiles theme)))
  (map :n :g/ (lambda [] (builtin.live_grep theme)))
  (map :n :<leader>p (lambda [] (extensions.projects.projects theme))))

;;; Autocompletion
;; Autocomplete brackets, quotes, etc.
(setup-package :nvim-autopairs)
;; Snippet engine
(setup-package :snippets {:create_cmp_source true :friendly_snippets true})
(let [cmp (require :cmp)
      sources cmp.config.sources
      mapping cmp.mapping]
  (cmp.setup {;; TODO: Check if this is required
              :snippet {:expand (lambda [args] (vim.snippet.expand args.body))}
              :sources (sources [;; LSP autocompletion source
                                 {:name :nvim_lsp}
                                 ;; Snippet autocompletion source
                                 {:name :snippets}
                                 ;; Filesystem path autocompletion source
                                 {:name :path}]
                                [;; Buffer autocompletion source
                                 {:name :buffer}])
              :mapping (mapping.preset.insert {:<tab> (mapping.confirm {:select true})
                                               :<cr> (mapping.confirm {:select true})})})
  (cmp.setup.cmdline ":"
                     {:sources (sources [;; Filesystem path autocompletion source
                                         {:name :path}
                                         ;; Command-line autocompletion source
                                         {:name :cmdline}])
                      :mapping (mapping.preset.cmdline)})
  (cmp.setup.cmdline ["/" "?"]
                     {:sources (sources [;; Buffer autocompletion source
                                         {:name :buffer}])
                      :mapping (mapping.preset.cmdline)}))

;;; VCS integration
;; Git commands in buffer
(let [gitsigns (require :gitsigns)]
  (gitsigns.setup {:on_attach (lambda [bufnr]
                                (map :n "[c"
                                     (if vim.wo.diff
                                         (cmd.normal "[c" {:bang true})
                                         (lambda [] (gitsigns.nav_hunk :prev)
                                           {:buffer bufnr})))
                                (map :n "]c"
                                     (lambda []
                                       (if vim.wo.diff
                                           (cmd.normal "]c" {:bang true})
                                           (gitsigns.nav_hunk :next
                                                              {:buffer bufnr}))))
                                (map :n "[C"
                                     (lambda []
                                       (when (not vim.wo.diff)
                                         (gitsigns.nav_hunk :first
                                                            {:buffer bufnr}))))
                                (map :n "]C"
                                     (lambda []
                                       (when (not vim.wo.diff)
                                         (gitsigns.nav_hunk :last
                                                            {:buffer bufnr})))))}))

;; Git client
(let [neogit (require :neogit)]
  (neogit.setup)
  (map :n :<leader>g neogit.open))

;;; Treesitter integration
(setup-package :nvim-treesitter.configs
               {;; Syntax highlighting
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
                :pairs {:enable true}})

;; Manipulate tag pairs
(setup-package :nvim-ts-autotag)
;; Manipulate S-expressions
(setup-package :treesitter-sexp)

;;; Refactoring
(setup-package :refactoring)
(setup-package :inc_rename)

;;; Formattor
(setup-package :conform {:format_after_save {}})
(set opt.formatexpr "v:lua.require'conform'.formatexpr()")

;;; Linter
(let [lint (require :lint)]
  (api.nvim_create_autocmd [:BufWritePost :BufReadPost :InsertLeave]
                           {:group (api.nvim_create_augroup :linting {})
                            :callback (lambda [] (lint.try_lint))}))

;;; Folding
;; TODO: Enable this
;; (let [ufo (require :ufo)]
;;   (ufo.setup {:provider_selector (lambda [] [:treesitter :indent])})
;;   (set opt.foldcolumn :1)
;;   (set opt.foldlevel 99)
;;   (set opt.foldlevelstart 99)
;;   (map :n :zR ufo.openAllFolds)
;;   (map :n :zM ufo.closeAllFolds))

;;; Terminal manager
(let [toggleterm (require :toggleterm)]
  (toggleterm.setup)
  (map :n :<leader>t toggleterm.toggle_command))

;;; Filesystem manager
;; Explorer in sidebar
(let [neotree (require :neo-tree)
      command (require :neo-tree.command)]
  (neotree.setup)
  (map :n :<leader>e (lambda [] (command.execute {:toggle true}))))

;; Explorer in buffer
(setup-package :oil)

;;; Project manager
(setup-package :project_nvim)

{}
