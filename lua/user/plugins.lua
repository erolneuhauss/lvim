-- Additional Plugins
lvim.plugins = {
  -- NOTE: switch between buffer you usually do and use TAB with arrow keys to move around
  "ghillb/cybu.nvim", -- Neovim plugin that offers context when cycling buffers in the form of a customizable notification window.

  -- NOTE: works with colorscheme "lunar" only set in "user.treesitter"
  "p00f/nvim-ts-rainbow", -- Rainbow parentheses for neovim using tree-sitter.

  -- NOTE: mappings "C-j" "C-k" "<C-u>" "<C-d>" "<C-b>" "<C-f>" "<C-y>" "<C-e>" "zt", "zz", "zb"
  "karb94/neoscroll.nvim", -- a smooth scrolling neovim plugin written in lua

  -- NOTE: mappings s{motion}{char}, ss{char} (cursor), SS{char} (line)
  -- "kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease

  -- NOTE: used in "user.treesitter" in combination of "p00f/nvim-ts-rainbow"
  "lunarvim/darkplus.nvim",

  "f-person/git-blame.nvim", -- git blame

  -- NOTE: e.g. :DiffviewFileHistory % -- show in diff view file history of current file
  -- usage: https://github.com/sindrets/diffview.nvim#usage
  "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    -- NOTE: mappings: f (;)
    -- Magenta letters indicate unique letter to jump with f
    -- Blue letters indicates non unique letter to jump with f followed by;
    "jinh0/eyeliner.nvim", -- Move faster with unique f/F indicators for each word on the line.
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
        dim = true
      }
    end,
  },
  -- https://github.com/LukasPietzschmann/telescope-tabs
  "LukasPietzschmann/telescope-tabs", -- Fly through your tabs in neovim ✈️
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- BUG: requires latexmk on local host. My LaTeX is dockerized
  -- { "lervag/vimtex" },
  { "towolf/vim-helm" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  { "pearofducks/ansible-vim" }, -- vim syntax plugin for ansible
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    -- NOTE: mappings: " in normal mode, c-r in insert mode
    "tversteeg/registers.nvim", -- Show register content when you try to access it in Neovim. Written in Lua.
    config = function()
      require("registers").setup()
    end,
  },

}
