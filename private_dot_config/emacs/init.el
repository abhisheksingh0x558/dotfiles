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
