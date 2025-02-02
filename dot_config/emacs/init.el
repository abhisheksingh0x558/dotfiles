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
