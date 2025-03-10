{ pkgs, ... }: {
  # Editor
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      # Keymaps
      unimpaired-nvim # Pairs of bracket keymaps
      comment-nvim # Manipulate comments
      nvim-surround # Manipulate surrounding pairs
      substitute-nvim # Exchange operator
      text-case-nvim # Manipulate text cases
      align-nvim # Manipulate alignments
      dial-nvim # Increment and decrement operator
      treesj # Split and join operator
      nvim-gomove # Move and duplicate block operator
      flash-nvim # Navigate with search labels
      grug-far-nvim # Find and replace
      nvim-various-textobjs # Text objects
      neogen # Annotation generator
      other-nvim # Alternative files
      scretch-nvim # Scratch files
      hydra-nvim # Sticky keymaps

      # UI/UX
      nvim-web-devicons # Icons
      tabby-nvim # Tabline
      feline-nvim # Statusline
      dashboard-nvim # Dashboard
      which-key-nvim # Helper popup for keys
      indent-blankline-nvim # Indentation guides
      nui-nvim # UI component library
      noice-nvim # UI for messages, cmdline, and popupmenu
      trouble-nvim # UI for diagnostics, references, telescope results, quickfix and location list
      nvim-notify # UI for notifications
      dressing-nvim # Improve UI defaults
      # TODO: Check if this is possilbe via treesitter
      todo-comments-nvim # Highlight todo comments
      rainbow-delimiters-nvim # Highlight brackets
      vim-illuminate # Highlight word under cursor
      focus-nvim # Window layout manager
      edgy-nvim # Window layout manager

      # Fuzzy finder
      telescope-nvim
      telescope-fzf-native-nvim # Fzf file sorter

      # Autocompletion
      nvim-autopairs # Autocomplete brackets, quotes, etc.
      nvim-snippets # Snippet engine
      # TODO: Enable this
      nvim-scissors # Manage snippets
      friendly-snippets # Snippets collection
      nvim-cmp
      cmp-buffer # Buffer autocompletion source
      cmp-path # Filesystem path autocompletion source
      cmp-nvim-lsp # LSP autocompletion source
      cmp-cmdline # Command-line autocompletion source

      # VCS integration
      gitsigns-nvim # Git commands in buffer
      git-conflict-nvim # Resolve merge conflicts
      diffview-nvim # Cycle diffs

      # Treesitter integration
      nvim-treesitter.withAllGrammars # Language queries and grammars
      nvim-treesitter-textobjects # Treesitter text objects
      nvim-treesitter-textsubjects # Treesitter context aware text objects
      nvim-ts-autotag # Manipulate tag pairs
      nvim-treesitter-pairs # Manipulate pair objects
      nvim-treesitter-context # Cursor context
      nvim-treesitter-sexp # Manipulate S-expressions
      nvim-ts-context-commentstring # Manipulate comments
      nvim-paredit # Paredit implementation for neovim

      # LSP integration
      nvim-lspconfig
      none-ls-nvim

      # Refactoring
      # TODO: Enable this
      nvim-treesitter-refactor
      refactoring-nvim
      inc-rename-nvim

      # Formatter
      conform-nvim

      # Linter
      nvim-lint

      # Folding
      nvim-ufo

      # Terminal manager
      toggleterm-nvim

      # Filesystem manager
      neo-tree-nvim # Explorer in sidebar
      oil-nvim # Explorer in buffer
      nvim-genghis # Commands for managing files and directories

      # Project manager
      project-nvim

      # Outliner
      aerial-nvim

      # Task runner
      overseer-nvim

      # Test runner
      neotest

      # Code runner
      sniprun

      # REPL runner
      iron-nvim
      # conjure # TODO: Enable this

      # Notebook runner
      molten-nvim

      # Debugger
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text

      # PKM tool
      neorg

      # AI integration
      # TODO: Enable this
      # avante-nvim

      # Session manager
      persistence-nvim

      # Github client
      octo-nvim
    ];
  };
}
