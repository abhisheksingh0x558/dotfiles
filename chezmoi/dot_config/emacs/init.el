;; -*- lexical-binding: t; -*-

(require 'treesit)

;;;; Package manager
(defvar elpaca-installer-version 0.10)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca leaf (require 'leaf))
(elpaca leaf-keywords
  (require 'leaf-keywords)
  (leaf-keywords-init))
(elpaca-wait)

;;; Path
;; TODO: Add de-duplication
(setenv "PATH" (concat (expand-file-name "~/.nix-profile/bin:") (getenv "PATH"))) ; Add Nix to path
(add-to-list 'exec-path "~/.nix-profile/bin") ; Add Nix to path

;;;; Code style
;;; Editorconfig integration
;(leaf editorconfig :elpaca t :config (editorconfig-mode))
;
;;;; Keymaps
;;; Vi layer
;(leaf evil
;  :elpaca t
;  :custom
;  (evil-want-keybinding nil) ; Do not set keymaps
;  (evil-undo-system 'undo-redo) ; Keymap for redo
;  :config
;  (evil-mode)
;  (evil-set-leader 'normal (kbd "SPC")) ; Leader key
;  (evil-set-leader 'normal "\\" t) ; Local leader key
;  (evil-global-set-key 'normal (kbd "<leader>SPC") 'project-find-file)) ; Find project files
;
;(leaf evil-collection
;  :elpaca t
;  :config (evil-collection-init))
;
;;;; UI/UX
;(setq inhibit-startup-screen t) ; Disable startup screen
;(setq initial-scratch-message nil) ; Disable scratch buffer message
;(global-display-line-numbers-mode) ; Enable line numbering
;(global-hl-line-mode) ; Enable line highlighting
;(setq evil-vsplit-window-right t) ; Put new window on right on vertical split
;(setq evil-split-window-below t) ; Put new window on bottom on horizontal split
;;; Theme
;(leaf catppuccin-theme
;  :elpaca t
;  :custom (catppuccin-flavor 'mocha)
;  :config (load-theme 'catppuccin :no-confirm))
;
;;;; Autocompletion
;(electric-pair-mode) ; Autoclose pairs
;;; Mini-buffer completion UI
;(leaf corfu
;  :elpaca t
;  :custom (corfu-auto t)
;  :config (global-corfu-mode))
;
;;;; Fuzzy finder
;;; In-buffer completion UI
;(leaf vertico
;  :elpaca t
;  :config (vertico-mode))
;
;;;; VCS integration
;;; Git client
;(leaf magit
;  :elpaca t
;  :defer t
;  :bind ("<leader>g" . magit)) ; Open git client
;
;;;; Treesitter integration
;;; Parsers to install
;(setq treesit-language-source-alist
;  '((nix "https://github.com/nix-community/tree-sitter-nix")
;     (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
;     (rust "https://github.com/tree-sitter/tree-sitter-rust")
;     (go "https://github.com/tree-sitter/tree-sitter-go")))
;;; Treesitter major modes
;(leaf nix-ts-mode
;  :defer t
;  :elpaca t)
;(leaf haskell-ts-mode
;  :defer t
;  :elpaca t)
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
;(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
;
;;;; LSP integration
;(leaf lsp-mode :defer t :elpaca t)
;(leaf lsp-haskell :defer t) :elpaca t
;;; Register language servers
;(add-hook 'nix-ts-mode-hook #'lsp)
;(add-hook 'haskell-ts-mode-hook #'lsp)
;(add-hook 'rust-ts-mode-hook #'lsp)
;(add-hook 'go-ts-mode-hook #'lsp)
;
;;;; Formatter integration
;(leaf apheleia
;  :defer t :elpaca t
;  :config
;  (apheleia-global-mode)
;  (add-to-list 'apheleia-formatters '(fourmolu . ("fourmolu" "--stdin-input-file" filepath)))
;  (add-to-list 'apheleia-mode-alist '(nix-ts-mode . nixfmt))
;  (add-to-list 'apheleia-mode-alist '(haskell-ts-mode . fourmolu))
;  (add-to-list 'apheleia-mode-alist '(go-ts-mode . gofumpt)))
