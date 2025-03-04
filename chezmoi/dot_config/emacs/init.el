;; -*- lexical-binding: t; -*-
;;; Package manager
(defvar elpaca-installer-version 0.10)
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git" :build (:not elpaca--activate-package)))
;; Install package manager
(let ((elpaca-path (expand-file-name "elpaca/repos/elpaca" user-emacs-directory))
      (elpaca-repo (plist-get (cdr elpaca-order) :repo)))
  (add-to-list 'load-path elpaca-path)
  (unless (file-exists-p elpaca-path)
    (let ((result (call-process "git" nil nil nil "clone" elpaca-repo elpaca-path)))
      (unless (zerop result) (kill-emacs result))
      (require 'elpaca)
      (elpaca-generate-autoloads "elpaca" elpaca-path))))
;; Load package manager
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
(leaf general
  :config
  (general-evil-setup t)
  (nmap
    "[d" #'flymake-goto-prev-error ; Goto previous flymake entry
    "]d" #'flymake-goto-next-error) ; Goto next flymake entry
    "[q" #'previous-error ; Goto previous error or xref entry
    "]q" #'next-error ; Goto next error or xref entry
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
;; In-buffer completion UI
(leaf corfu
  :custom ((corfu-auto . t))
  :config (global-corfu-mode))

;;; Fuzzy finder
;; Mini-buffer completion UI
(leaf vertico :config (vertico-mode))
;; Mini-buffer commands
(leaf consult :bind (("<leader>SPC" . find-file))) ; Find files in current directory

;;; VCS integration
;; Git client
(leaf transient) ; TODO: Check why is this required
(leaf magit :bind (("<leader>g" . magit))) ; Open git client
;; Git commands in buffer
(leaf diff-hl
  :config
  (global-diff-hl-mode)
  (nmap
    "[c" #'diff-hl-previous-hunk ; Goto previous hunk
    "]c" #'diff-hl-next-hunk  ; Goto next hunk
    "[x" #'smerge-prev ; Goto previous conflict
    "]x" #'smerge-next) ; Goto next conflict
  (nmap
    :keymaps 'smerge-mode-map
    :prefix "c"
    "o" #'smerge-keep-upper ; Choose ours
    "t" #'smerge-keep-lower ; Choose theirs
    "b" #'smerge-keep-all ; Choose both
    "n" #'smerge-keep-base)) ; Choose none

;;; Treesitter integration
;; Parsers to install
(setq treesit-language-source-alist
      '((nix "https://github.com/nix-community/tree-sitter-nix")
        (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")))
;; Install parsers on startup
(mapc
  (lambda (source)
    (unless (treesit-language-available-p (car source))
      (treesit-install-language-grammar (car source))))
  treesit-language-source-alist)
;; Treesitter major modes
(leaf nix-ts-mode :mode "\\.nix\\'")
(leaf haskell-ts-mode :mode "\\.hs\\'")
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))

;;; LSP integration
(leaf lsp-mode
  :custom
  ((lsp-references-exclude-declaration . t)) ; Exclude declaration from lsp references
  :config
  (nmap
    "grr" #'lsp-find-references ; Find lsp references
    "gri" #'lsp-find-implementation) ; Find lsp implementations
  ;; Register language servers
  :hook
  ((nix-ts-mode-hook . lsp)
   (haskell-ts-mode-hook . lsp)
   (rust-ts-mode-hook . lsp)
   (go-ts-mode-hook . lsp)))
(leaf lsp-haskell)

;;; Formatter integration
(leaf apheleia
  :config
  (apheleia-global-mode)
  :defer-config
  (add-to-list 'apheleia-mode-alist '(go-ts-mode . gofumpt)))
