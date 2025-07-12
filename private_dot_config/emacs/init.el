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
