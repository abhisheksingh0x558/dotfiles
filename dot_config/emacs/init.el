;; -*- lexical-binding: t -*-

;;; Package manager
(setq elpaca-installer-version 0.11)
;; Load package manager
(let ((elpaca-path (expand-file-name "elpaca/repos/elpaca" user-emacs-directory)))
  (add-to-list 'load-path elpaca-path))
(unless (require 'elpaca-autoloads nil t)
  (require 'elpaca)
  (elpaca-generate-autoloads "elpaca" elpaca-path))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :repo "https://github.com/progfolio/elpaca.git" :build (:not elpaca--activate-package)))
(elpaca leaf
  (require 'leaf)
  (setq leaf-defaults '(:elpaca t)))
(elpaca leaf-keywords
  (require 'leaf-keywords)
  (leaf-keywords-init))
(elpaca-wait)

;;; Code style
(editorconfig-mode) ; EditorConfig integration

;;; Keymaps
;; Vi layer
(leaf evil
  :custom
  ((evil-want-keybinding . nil) ; Do not set keymaps
   (evil-undo-system . #'undo-redo)) ; Keymap for redo
  :config
  (evil-mode)
  (evil-set-leader 'normal (kbd "SPC")) ; Leader key
  (evil-set-leader 'normal "\\" t)) ; Local leader key
(leaf evil-collection
  :custom ((evil-collection-key-blacklist . '("[q" "]q"))) ; Disable keymaps
  :config (evil-collection-init))
(leaf evil-commentary :config (evil-commentary-mode)) ; Manipulate comments
(leaf evil-surround :config (global-evil-surround-mode)) ; Manipulate surrounding pairs
(leaf evil-exchange) ; Exchange text
(leaf evil-string-inflection) ; Manipulate text cases
(leaf evil-snipe) ; Navigate with search labels
(leaf evil-lion) ; Manipulate alignments
(leaf general
  :config
  (general-evil-setup t)
  (nmap
    "[q" #'previous-error ; Goto previous error or xref entry
    "]q" #'next-error ; Goto next error or xref entry
    "[x" #'smerge-prev ; Goto previous conflict
    "]x" #'smerge-next) ; Goto next conflict
  (nmap
    :keymaps 'smerge-mode-map
    :prefix "c"
    "o" #'smerge-keep-upper ; Choose ours
    "t" #'smerge-keep-lower ; Choose theirs
    "b" #'smerge-keep-all ; Choose both
    "0" #'smerge-keep-base) ; Choose none
  (nmap
    :keymaps 'xref--xref-buffer-mode-map
    "k" #'xref-prev-line ; Goto previous xref entry
    "j" #'xref-next-line)) ; Goto next xref entry

;;; UI/UX
(setq inhibit-startup-screen t) ; Disable startup screen
(setq initial-scratch-message nil) ; Disable scratch buffer message
(global-display-line-numbers-mode) ; Enable line numbering
(global-hl-line-mode) ; Enable line highlighting
(setq evil-vsplit-window-right t) ; Put new window on right on vertical split
(setq evil-split-window-below t) ; Put new window on bottom on horizontal split
(recentf-mode) ; Track recent files
;; Theme
(leaf catppuccin-theme
  :custom ((catppuccin-flavor . 'mocha))
  :config (load-theme 'catppuccin :no-confirm))
(leaf breadcrumb :config (breadcrumb-mode)) ; Breadcrumbs ; TODO: Replace with lsp alternative
(leaf highlight-indent-guides :config (highlight-indent-guides-mode)) ; Indentation guides
(leaf hl-todo :config (global-hl-todo-mode)) ; Highlight todo comments
(leaf symbol-overlay :config (symbol-overlay-mode)) ; Highlight lsp references ; TODO: Replace with lsp alternative
(leaf rainbow-delimiters :config (rainbow-delimiters-mode)) ; Highlight brackets

;;; Spell checker
(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'prog-mode-hook #'flyspell-mode)

;;; Autocompletion
(electric-pair-mode) ; Autoclose pairs
(leaf yasnippet :config (yas-global-mode)) ; Snippet engine
(leaf yasnippet-snippets) ; Snippet collection
;; In-buffer completion UI
(leaf corfu
  :custom
  ((corfu-auto . t)
   (corfu-auto-prefix . 1)) ; Trigger autocompletion popup after typing 1 character
  :config (global-corfu-mode))
;; In-buffer completion extensions
(leaf yasnippet-capf)
(leaf cape :config (add-to-list 'completion-at-point-functions (cape-capf-super #'lsp-completion-at-point #'yasnippet-capf)))

;;; Fuzzy finder
(leaf vertico :config (vertico-mode)) ; Mini-buffer completion UI
;; Fuzzy matcher
(leaf prescient
  :custom ((prescient-filter-method . '(fuzzy)))
  :defer-config (prescient-persist-mode))
(leaf vertico-prescient :config (vertico-prescient-mode))
(leaf corfu-prescient :config (corfu-prescient-mode))
;; Mini-buffer commands
(leaf consult
  :custom ((xref-show-xrefs-function . #'consult-xref))
  :config
  (nmap
    ;; Find files in current directory
    "<leader>SPC" #'(lambda ()
                      (interactive)
                      (if (project-current)
                          (call-interactively #'project-find-file)
                        (call-interactively #'consult-fd)))

    "<leader>BS" #'consult-recent-file ; Find recent files
    "g/" #'consult-line ; Search current file
    "<leader>/" #'consult-ripgrep)) ; Search project buffers
(leaf consult-lsp)

;;; VCS integration
;; Git client
(leaf transient) ; TODO: Autoload this package
(leaf magit
  :bind
  (("<leader>gg" . magit) ; Open git client
   (:magit-mode-map ("C-r" . magit-refresh)))) ; Refresh magit status
;; Git commands in file
(leaf diff-hl
  :config (global-diff-hl-mode)
  (nmap
    "[c" #'diff-hl-previous-hunk ; Goto previous hunk
    "]c" #'diff-hl-next-hunk)) ; Goto next hunk

;;; Filesystem manager
(leaf treemacs) ; Filesystem explorer in sidebar

;;; Terminal manager
(leaf (aweshell :repo "https://github.com/manateelazycat/aweshell.git")) ; TODO: Add this repo to melpa registry

;;; REPL manager
(leaf repl-toggle)
(leaf eval-in-repl)

;;; Snippet executer
(leaf quickrun)

;;; Folding
(leaf origami)

;;; Outliner
(leaf lsp-treemacs) ; TODO: Replace with non lsp treesitter based alternative

;;; Treesitter integration
(leaf treesit-auto
  :custom ((treesit-auto-install . t)) ; Install parsers when required
  :config
  (require 'treesit-auto) ; TODO: Autoload this package
  (treesit-auto-add-to-auto-mode-alist 'all) ; Enable treesitter based mode for all available parsers
  (global-treesit-auto-mode))

;;; LSP integration
(leaf lsp-mode
  :custom
  ((lsp-completion-enable . nil) ; Disable autocompletion setup
   (lsp-diagnostics-provider . :none) ; Disable diagnostics setup
   (lsp-references-exclude-declaration . t)) ; Exclude declaration from lsp references
  :config
  (nmap
    "grr" #'lsp-find-references ; Find lsp references
    "gri" #'lsp-find-implementation)) ; Find lsp implementations
(leaf lsp-ui
  :custom
  ((lsp-ui-doc-show-with-mouse . nil) ; Do not show lsp hover documentation on mouse hover
   (lsp-ui-doc-position . 'at-point)) ; Show lsp hover documentation above cursor
  :config (nmap "K" #'lsp-ui-doc-glance)) ; Show lsp hover documentation
(leaf lsp-haskell) ; Haskell
(leaf lsp-metals) ; Scala

;;; Linter
(leaf flycheck
  :config (global-flycheck-mode)
  (nmap
    "[d" #'flycheck-previous-error ; Goto previous flycheck entry
    "]d" #'flycheck-next-error)) ; Goto next flycheck entry

;;; Formatter
(leaf apheleia :config (apheleia-global-mode))

;;; Debugger
(leaf dap-mode)

;;; AI integration
(leaf gptel)
(leaf elysium)

;;; GitHub client
(leaf forge)

;;; Language configurations
(defvar languages
  '(;; Nix
    (nix-ts-mode
     :language-server nix-nil
     :linters (statix)
     :formatters (nixfmt))

    ;; Haskell
    (haskell-ts-mode
     :language-server lsp-haskell
     :linters (haskell-hlint)
     :formatters (fourmolu))

    ;; Rust
    (rust-ts-mode
     :language-server rust-analyzer
     :linters (rust-clippy)
     :formatters (rustfmt))

    ;; Go
    (go-ts-mode
     :language-server gopls
     :linters (go-staticcheck)
     :formatters (gofumpt))

    ;; Scala
    (scala-mode
     :language-server metals
     :linters nil ; TODO: Add linters
     :formatters (scalafmt)) ; TODO: Add formatters

    ;; PureScript
    (purescript-mode
     :language-server purescript-language-server
     :linters nil ; TODO: Add linters
     :formatters (purs-tidy))

    ;; C++
    (c++-ts-mode
     :language-server clangd
     :linters (c/c++-cppcheck)
     :formatters (clang-format))))

;;; Setup language tools
(setq apheleia-mode-alist '())
(defun setup-language (mode config)
  (let ((language-server (plist-get config :language-server))
        (linters (plist-get config :linters))
        (formatters (plist-get config :formatters))
        (hook (intern (concat (symbol-name mode) "-hook"))))
    ;; Register language server
    (when language-server
      (add-hook hook
                #'(lambda ()
                    (setq-local lsp-enabled-clients `(,language-server))
                    (lsp-deferred))))
    ;; Register linters
    (when linters
      (add-hook hook
                #'(lambda ()
                    (require 'lsp-diagnostics) ; TODO: Autoload this package
                    (lsp-diagnostics-flycheck-enable)
                    (setq-local flycheck-checker (car linters))
                    (let ((current-linter (car linters)))
                      (dolist (linter (cdr linters))
                        (flycheck-add-next-checker current-linter `(t . ,linter) t)
                        (setq current-linter linter))
                      (flycheck-add-next-checker current-linter '(t . lsp) t)))))
    ;; Register formatters
    (when formatters
      (add-to-list 'apheleia-mode-alist `(,mode ,@formatters)))))

;;; Setup tools for all configured languages
(dolist (language languages)
  (setup-language (car language) (cdr language)))

;;; Nix support
(leaf nix-mode)
(leaf nix-ts-mode)

;;; Haskell support
(leaf haskell-mode)
(leaf haskell-ts-mode)

;;; Rust support
(leaf rust-mode)

;;; Go support
(leaf go-mode)

;;; Scala support
(leaf scala-mode)
(leaf scala-ts-mode) ; TODO: Add scala mode as parent

;;; PureScript support
(leaf purescript-mode)
;; TODO: Setup purescript treesitter mode
