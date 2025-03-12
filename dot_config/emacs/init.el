;; -*- lexical-binding: t -*-

;;; Package manager
(defvar elpaca-installer-version 0.11)
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git" :build (:not elpaca--activate-package)))
;; Load package manager
(let ((elpaca-path (expand-file-name "elpaca/repos/elpaca" user-emacs-directory))
      (elpaca-repo (plist-get (cdr elpaca-order) :repo)))
  (add-to-list 'load-path elpaca-path))
(unless (require 'elpaca-autoloads nil t)
  (require 'elpaca)
  (elpaca-generate-autoloads "elpaca" elpaca-path))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
(elpaca leaf
  (require 'leaf)
  (setq leaf-defaults '(:elpaca t)))
(elpaca leaf-keywords
  (require 'leaf-keywords)
  (leaf-keywords-init))
(elpaca-wait)

;;; Path
;; Add Nix to path
(let ((path (getenv "PATH"))
      (nix-path (expand-file-name "~/.nix-profile/bin")))
  (unless (string-match-p (regexp-quote nix-path) path)
    (setenv "PATH" (concat nix-path ":" path)))
  (add-to-list 'exec-path nix-path))

;;; Code style
(editorconfig-mode) ; Editorconfig integration

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
  :custom ((evil-collection-key-blacklist . '("[q" "]q"))) ; Keymaps not to be defined
  :config
  (evil-collection-init))
(leaf evil-commentary :config (evil-commentary-mode)) ; Manipulate comments
(leaf evil-surround :config (global-evil-surround-mode)) ; Manipulate surrounding pairs
(leaf general
  :config
  (general-evil-setup t)
  ;; Find files in current directory
  (nmap
    "<leader>SPC" #'(lambda ()
                      (interactive)
                      (if (project-current)
                        (call-interactively #'project-find-file)
                        (call-interactively #'find-file)))
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
;; Theme
(leaf catppuccin-theme
  :custom ((catppuccin-flavor . 'mocha))
  :config (load-theme 'catppuccin :no-confirm))

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
(leaf consult :custom ((xref-show-xrefs-function . #'consult-xref)))
(leaf consult-lsp)

;;; VCS integration
;; Git client
(leaf transient) ; Dependency for magit ; TODO: This should be installed automatically without explicitely listing here
(leaf magit
  :bind
  (("<leader>gg" . magit) ; Open git client
   (:magit-mode-map ("C-r" . magit-refresh)))) ; Refresh magit status
;; Git commands in buffer
(leaf diff-hl
  :config
  (global-diff-hl-mode)
  (nmap
    "[c" #'diff-hl-previous-hunk ; Goto previous hunk
    "]c" #'diff-hl-next-hunk)) ; Goto next hunk

;;; Filesystem manager
(leaf treemacs) ; Filesystem explorer in sidebar

;;; Terminal manager
(leaf (aweshell :repo "https://github.com/manateelazycat/aweshell.git"))

;;; REPL manager
(leaf repl-toggle)
(leaf eval-in-repl)

;;; Snippet executer
(leaf quickrun)

;;; Treesitter integration
;; Parsers to install
(setq treesit-language-source-alist '())
;; Install parsers on startup
(mapc
  (lambda (source)
    (unless (treesit-language-available-p (car source))
      (treesit-install-language-grammar (car source))))
  treesit-language-source-alist)

;;; LSP integration
(leaf lsp-mode
  :custom
  ((lsp-completion-enable . nil) ; Disable autocompletion setup
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

;;; Linter integration
(leaf flycheck
  :config
  (global-flycheck-mode)
  (nmap
    "[d" #'flycheck-previous-error ; Goto previous flycheck entry
    "]d" #'flycheck-next-error) ; Goto next flycheck entry
  :hook
  ;; Register linters
  ((lsp-diagnostics-mode-hook . (lambda ()
                                  (setq flycheck-checker 'lsp)
                                  (let ((next-checkers (flycheck-get-next-checkers 'lsp)))
                                    (dolist (next next-checkers)
                                      (flycheck-remove-next-checker 'lsp next)))))))
