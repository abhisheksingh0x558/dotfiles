;; -*- lexical-binding: t -*-

;; Elisp path
(defvar my-elisp-path (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path my-elisp-path) ; Custom modules

;; Load modules
(defun my-load(prefix)
  (dolist (module (directory-files my-elisp-path nil (format "%s-.+\\.el$" (regexp-quote prefix))))
    (require (intern (file-name-base module)))))

;; Load core modules
(my-load "my-core")
