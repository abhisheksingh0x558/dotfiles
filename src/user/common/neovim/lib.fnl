(local vim _G.vim)

;;; Require modules in directory
(lambda require-modules [directory]
  (let [files (vim.fn.readdir (vim.fs.joinpath (vim.fn.stdpath :config) :lua
                                               directory))]
    (icollect [_ file (ipairs files)]
      (require (.. directory "." (file:sub 1 -5))))))

;;; Set options
(lambda set-options [options]
  (let [namespace :g]
    (each [key value (pairs options)]
      (when (not= key namespace) (set (. vim :opt key) value)))
    (each [key value (pairs (or (. options namespace) {}))]
      (set (. vim namespace key) value))))

;;; Set keymaps
(lambda set-keymaps [keymaps]
  (each [_ [modes key action options] (ipairs keymaps)]
    (vim.keymap.set modes key action options)))

;;; Setup plugins
(lambda setup-plugin [plugin]
  (match (type plugin)
    :string (let [module (require plugin)] (module.setup {}))
    :table (let [module (require plugin.name)]
             (when plugin.pre-hook (plugin.pre-hook module))
             (match (type plugin.setup)
               :nil (module.setup {})
               :boolean (when plugin.setup (module.setup {}))
               :table (module.setup plugin.setup)
               :function (module.setup (plugin.setup module)))
             (when plugin.post-hook (plugin.post-hook module))
             (match (type plugin.options)
               :table (set-options plugin.options)
               :function (set-options (plugin.options module)))
             (match (type plugin.keymaps)
               :table (set-keymaps plugin.keymaps)
               :function (set-keymaps (plugin.keymaps module))))))

{: require-modules : set-options : set-keymaps : setup-plugin}
