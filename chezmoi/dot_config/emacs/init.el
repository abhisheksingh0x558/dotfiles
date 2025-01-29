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
  ;; Find files in current directory
  (nmap "<leader>SPC" #'(lambda ()
                          (interactive)
                          (if (project-current)
                            (call-interactively #'project-find-file)
                            (call-interactively #'find-file))))
  (nmap
    "[d" #'flymake-goto-prev-error ; Goto previous flymake entry
    "]d" #'flymake-goto-next-error ; Goto next flymake entry
    "[q" #'previous-error ; Goto previous error or xref entry
    "]q" #'next-error) ; Goto next error or xref entry
  (nmap
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
(leaf tempel :config (add-to-list 'completion-at-point-functions #'tempel-expand)) ; Snippet engine
(leaf tempel-collection) ; Snippet collection
;; In-buffer completion UI
(leaf corfu
  :custom ((corfu-auto . t))
  :config (global-corfu-mode))
;; In-buffer completion extensions
(leaf cape)

;;; Fuzzy finder
;; Mini-buffer completion UI
(leaf vertico :config (vertico-mode))
;; Fuzzy matcher
(leaf prescient
  :custom ((prescient-filter-method . '(fuzzy)))
  :config (prescient-persist-mode))
(leaf vertico-prescient :config (vertico-prescient-mode))
(leaf corfu-prescient :config (corfu-prescient-mode))
;; Mini-buffer commands
(leaf consult :custom ((xref-show-xrefs-function . #'consult-xref)))
(leaf consult-lsp)

;;; VCS integration
;; Git client
(leaf transient) ; TODO: Check why is this required
(leaf magit
  :bind
  (("<leader>g" . magit) ; Open git client
   (:magit-mode-map ("C-r" . magit-refresh)))) ; Refresh magit status
;; Git commands in buffer
(leaf diff-hl
  :config
  (global-diff-hl-mode)
  (nmap
    "[c" #'diff-hl-previous-hunk ; Goto previous hunk
    "]c" #'diff-hl-next-hunk)) ; Goto next hunk
