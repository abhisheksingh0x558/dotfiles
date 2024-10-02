(local lib (require :lib))

;;; Set options
(let [options (require :option)]
  (lib.set-options options))

;;; Set keymaps
(let [keymaps (require :keymap)]
  (lib.set-keymaps keymaps))

;;; Setup plugins
(each [_ plugins (ipairs (lib.require-modules :plugin))]
  (each [_ plugin (ipairs plugins)]
    (lib.setup-plugin plugin)))

{}
