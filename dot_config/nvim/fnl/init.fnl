(macro defkey [mode key action]
  (if (= :string (type action))
      `(vim.keymap.set ,mode ,key ,action)
      `(vim.keymap.set ,mode ,key (lambda [] ,action))))

{}
