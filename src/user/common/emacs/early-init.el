;; -*- lexical-binding: t; -*-

;;; UI/UX
(menu-bar-mode 0) ; Menu bar
(tool-bar-mode 0) ; Tool bar
(scroll-bar-mode 0) ; Scroll bar
;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
