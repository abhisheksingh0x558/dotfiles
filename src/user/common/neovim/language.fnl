{;;; Fennel
 :fennel {;; Language server
          :server :fennel_ls
          ;; Formatters
          :formatters [:fnlfmt]
          ;; Linters
          :linters [:fennel]}
 ;;; Nix
 :nix {;; Language server
       :server :nil_ls
       ;; Formatters
       :formatters [:nixfmt]
       ;; Linters
       :linters [:deadnix]}}
