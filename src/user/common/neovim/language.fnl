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
       :linters [:deadnix]}
 ;;; Nu
 ;; TODO: Add formatters and linters
 :nu {;; Language server
      :server :nushell}
 ;;; Haskell
 :haskell {;; Language server
           :server :hls
           ;; Formatters
           :formatters [:fourmolu]
           ;; Linters
           :linters [:hlint]}
 ;;; Go
 :go {;; Language server
      :server :gopls
      ;; Formatters
      :formatters [:gofumpt]
      ;; Linters
      :linters [:staticcheck]}}
