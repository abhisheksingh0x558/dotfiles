;; -*- lexical-binding: t; -*-

(require 'package)
(require 'cus-edit)
(require 'use-package-core)
(require 'use-package-ensure)

;;; Package manager
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) ; Add melpa as package repository
;; Package customizations
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
(setq use-package-always-ensure t) ; Automatically install packages

;;; Path
;; TODO: Add de-duplication
(setenv "PATH" (concat (expand-file-name "~/.nix-profile/bin:") (getenv "PATH"))) ; Add Nix to path
(add-to-list 'exec-path "~/.nix-profile/bin") ; Add Nix to path

;;; Code style
;; Editorconfig integration
(use-package editorconfig :config (editorconfig-mode))
