--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
--
-- NOTE: adjustment for neovide
if vim.g.neovide then
  vim.opt.guifont = { "Hack Nerd Font", ":h22" }
  -- Allow clipboard copy paste in neovim
  vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
  vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- end

-- vim options
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesitter based folding
vim.opt.foldmethod = 'manual'
vim.opt.iskeyword:append("-")
vim.opt.mouse = 'nvi'         --default: 'nvi' normal, visual and insert mode
vim.opt.relativenumber = true --default: false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true --default: false display lines as one long line

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":CybuNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":CybuPrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"
-- BUG: with "lunar". lazygit defaulted to default dark in neovide and colors where bad
lvim.colorscheme = "tokyonight-night"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- BUG: This does not seem to have the intended effect
-- there comment out
-- lvim.builtin.indentlines = {
--   active = true,
--   on_config_done = nil,
--   options = {
--     enabled = true,
--     buftype_exclude = { "terminal", "nofile" },
--     filetype_exclude = {
--       "help",
--       "startify",
--       "dashboard",
--       "packer",
--       "neogitstatus",
--       "NvimTree",
--       "Trouble",
--       "text",
--     },
--     char = lvim.icons.ui.LineLeft,
--     show_trailing_blankline_indent = false,
--     show_first_indent_level = true,
--     use_treesitter = true,
--     show_current_context = true,
--   },
-- }

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<CR>", "Find Files" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>NvimTreeFocus<CR>", "Focus Explorer" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Todo and Tabs",
  t = {
    "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
    "Find Tab",
  },
  n = { "<cmd>tabnew %<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
  o = { "<cmd>tabonly<cr>", "Only Tab" },

  a = { "<cmd>TodoTrouble<cr>", "All Todos in Project" },
  r = { "<cmd>%substitute/\\v\\s+$//eg<cr>", "Trim Trailing Whitespace" },
  p = { "<cmd>TodoTelescope<cr>", "TodoTelescope all Projects" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "tab"
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "hcl", -- Terraform (HashiCorp Configuration Language)
  "java",
  "javascript",
  "json",
  "lua",
  "python",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  "ansiblels",
  "bashls",
  "jsonls",
  "marksman",
  "lua_ls",
  "terraformls",
  "texlab",
  "tflint",
  "yamlls",
}

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = true

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls.
-- WARN: !!Requires `:LvimCacheReset` to take effect!!
-- :LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "tflint"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8",       filetypes = { "python" } },
  { command = "shellcheck",   filetypes = { "sh" } },
  { command = "markdownlint", filetypes = { "markdown" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

-- Additional Plugins
lvim.plugins = {
  -- NOTE: works with colorscheme "lunar" only set in "user.treesitter"
  "p00f/nvim-ts-rainbow", -- Rainbow parentheses for neovim using tree-sitter.

  -- NOTE: mappings "C-j" "C-k" "<C-u>" "<C-d>" "<C-b>" "<C-f>" "<C-y>" "<C-e>" "zt", "zz", "zb"
  "karb94/neoscroll.nvim", -- a smooth scrolling neovim plugin written in lua

  -- NOTE: mappings s{motion}{char}, ss{char} (cursor), SS{char} (line)
  -- "kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease

  -- NOTE: used in "user.treesitter" in combination of "p00f/nvim-ts-rainbow"
  "lunarvim/darkplus.nvim",

  -- NOTE: mappings leader-key "m"
  "MattesGroeger/vim-bookmarks", -- This vim plugin allows toggling bookmarks per line

  -- NOTE: switch between buffer you usually do and use TAB with arrow keys to move around
  "ghillb/cybu.nvim", -- Neovim plugin that offers context when cycling buffers in the form of a customizable notification window.

  -- WARN: Not sure, if this is truly beneficial. Did not see any effect
  "moll/vim-bbye", -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.

  -- WARN: This behaves somewhat buggy I think. Did not really grap the benefit besides Telescope changes
  "windwp/nvim-spectre",     -- search by rg and replace by sed

  "f-person/git-blame.nvim", -- git blame

  -- NOTE: removes status line a centers text in the middle
  "folke/zen-mode.nvim", -- Distraction-free coding

  -- NOTE: Decided not to use it. Usefulness questionable: https://alpha2phi.medium.com/neovim-for-beginners-lsp-inlay-hints-bf4a8afa6f27
  -- "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.

  -- NOTE: I do not use quickfix, yet. Maybe of use https://github.com/kevinhwang91/nvim-bqf#function-table
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.

  -- NOTE: in instert mode type : and collection of emojis pop up
  "hrsh7th/cmp-emoji", -- nvim-cmp source for emojis.

  -- Leap is a general-purpose motion plugin for Neovim
  -- NOTE: https://github.com/ggandor/leap.nvim/#how-to-use-it-tldr
  -- {
  --   "ggandor/leap.nvim",
  --   require('leap').add_default_mappings()
  -- },

  -- NOTE: Peeking the buffer while entering command :{number}
  "nacro90/numb.nvim", -- numb.nvim is a Neovim plugin that peeks lines of the buffer in non-obtrusive way.

  -- NOTE: e.g. :DiffviewFileHistory % -- show in diff view file history of current file
  -- usage: https://github.com/sindrets/diffview.nvim#usage
  "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    -- NOTE: mappings: f/F (;)
    -- Magenta letters indicate unique letter to jump with f/F
    -- Blue letters indicates non unique letter to jump with f/F followed by;
    "jinh0/eyeliner.nvim", -- Move faster with unique f/F indicators for each word on the line.
    config = function()
      require("eyeliner").setup {
        highlight_on_key = false,
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
  {
    -- NOTE: use :YankyRingHistory
    -- TODO: integrate it with Telescope: https://github.com/gbprod/yanky.nvim#%EF%B8%8F-configuration-2
    "gbprod/yanky.nvim", -- Show register content when you try to access it in Neovim. Written in Lua.
    config = function()
      require("yanky").setup()
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    end,
  },

  -- NOTE: highlight trailing whitespace
  {
    "johnfrankmorgan/whitespace.nvim",
    config = function()
      require("whitespace-nvim").setup({
        highlight = "Cursor",
        ignored_filetypes = {
          -- BUG: 'space-;' (dashboard) still shows whitespaces
          "",
          "DressingInput",
          "DressingSelect",
          "Jaq",
          "NvimTree",
          "Outline",
          "TelescopePrompt",
          "Trouble",
          "alpha",
          "dap-repl",
          "dap-terminal",
          "dapui_console",
          "dashboard",
          "dirvish",
          "fugitive",
          "harpoon",
          "help",
          "lab",
          "lir",
          "neo-tree",
          "neogitstatus",
          "nofile",
          "noice",
          "notify",
          "packer",
          "spectre_panel",
          "startify",
          "toggleterm",
          "text",
        },
      })
      -- remove trailing whitespace with a keybinding
      -- vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
    end
  }
}

reload "user.neoscroll"
reload "user.cybu"
-- reload "user.surround"
reload "user.bookmark"
reload "user.zen-mode"
reload "user.inlay-hints"
-- reload "user.whichkey"
reload "user.telescope"
reload "user.bqf"
reload "user.numb"
reload "user.treesitter"
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- NOTE: improved highlight matching parens (brackets, braces etc.) by bright background color
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "*" },
  -- based on :hi lualine_a_command
  command = "highlight MatchParen guifg=#16161e guibg=#e0af68",
})
-- NOTE: trim trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%substitute/\s\+$//e]],
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
