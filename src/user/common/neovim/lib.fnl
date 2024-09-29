(local vim _G.vim)

;;; Set options
(lambda set-options [options]
  (let [namespace :g]
    (each [key value (pairs options)]
      (when (not= key namespace) (set (. vim :opt key) value)))
    (each [key value (pairs (or (. options namespace) {}))]
      (set (. vim namespace key) value))))

{: set-options}
