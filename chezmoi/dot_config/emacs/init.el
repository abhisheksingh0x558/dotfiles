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
