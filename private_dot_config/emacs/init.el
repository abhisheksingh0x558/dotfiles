;; -*- lexical-binding: t -*-

;; Elisp path
(defvar my-elisp-path (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path my-elisp-path) ; Custom modules

;; Load package manager
(setq elpaca-installer-version 0.11)
(let ((elpaca-path (expand-file-name "elpaca/repos/elpaca" user-emacs-directory)))
  (add-to-list 'load-path elpaca-path)
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" elpaca-path)))
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

;; Load modules
(defun my-load(prefix)
  (dolist (module (directory-files my-elisp-path nil (format "%s-.+\\.el$" (regexp-quote prefix))))
    (require (intern (file-name-base module)))))

;; Load core modules
(my-load "my-core")

;; Setup packages
(let ((specs '()))
  (dolist (module (directory-files my-elisp-path t "my-spec-.+\\.el$"))
    (with-temp-buffer
      (insert-file-contents module)
      (let ((spec (eval (read (buffer-string)))))
        (when spec (setq specs (append specs spec))))))
  (dolist (spec specs)
    (pcase spec
      (`(,name . ,arguments)
        (eval (macroexpand `(leaf ,name ,@arguments))))
      ((pred symbolp)
        (eval (macroexpand `(leaf ,spec))))
      (_ (message "invalid package specification: %S" spec)))))
(elpaca-wait)

;; Load package modules
(my-load "my-pkg")

;;; Code style
(editorconfig-mode) ; EditorConfig integration

;;; UI/UX
(setq inhibit-startup-screen t) ; Disable startup screen
(setq initial-scratch-message nil) ; Disable scratch buffer message
(global-display-line-numbers-mode) ; Enable line numbering
(global-hl-line-mode) ; Enable line highlighting
(setq evil-vsplit-window-right t) ; Put new window on right on vertical split
(setq evil-split-window-below t) ; Put new window on bottom on horizontal split
(setq create-lockfiles nil) ; Do not create lockfiles ; TODO: Make this consistent with Neovim
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))) ; Backup directory ; TODO: Make this consistent with Neovim
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "autosaves" user-emacs-directory) t))) ; Autosave directory ; TODO: Make this consistent with Neovim
(recentf-mode) ; Track recent files
;; Theme
(leaf doom-themes
  :config (load-theme 'doom-tokyo-night t))
;; Modeline
(leaf doom-modeline
  :config (doom-modeline-mode))
(leaf breadcrumb :config (breadcrumb-mode)) ; Breadcrumbs ; TODO: Replace with lsp alternative
(leaf highlight-indent-guides :config (highlight-indent-guides-mode)) ; Indentation guides
(leaf hl-todo :config (global-hl-todo-mode)) ; Highlight to do comments
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
  (evil-define-key 'normal 'global
    ;; Find files in current directory
    (kbd "<leader>SPC") #'(lambda ()
                            (interactive)
                            (if (project-current)
                              (call-interactively #'project-find-file)
                              (call-interactively #'consult-fd)))
    ;; Find buffers
    (kbd "<leader>TAB") #'(lambda ()
                            (interactive)
                            (if (project-current)
                              (call-interactively #'consult-project-buffer)
                              (call-interactively #'consult-buffer)))
    (kbd "<leader>BS") #'consult-recent-file ; Find recent files
    "g/" #'consult-line ; Search current file
    (kbd "<leader>/") #'consult-ripgrep)) ; Search project buffers
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
  (evil-define-key 'normal 'global
    "[c" #'diff-hl-previous-hunk ; Go to previous hunk
    "]c" #'diff-hl-next-hunk)) ; Go to next hunk

