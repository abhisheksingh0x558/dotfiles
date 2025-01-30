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
