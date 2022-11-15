-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesitter based folding
vim.opt.foldmethod = 'manual'
vim.opt.mouse = 'a' --default: 'a'
vim.opt.relativenumber = true --default: false
vim.opt.wrap = true --default: false display lines as one long line
vim.opt.iskeyword:append("-")

lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":CybuNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":CybuPrev<CR>"
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
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- lvim.builtin.terminal.execs = {
--       { vim.o.shell, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
--       { vim.o.shell, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
--       { vim.o.shell, "<C-'>", "Float Terminal", "float", nil },
--     }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope fd<CR>", "Find Files" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>NvimTreeFocus<CR>", "Focus Explorer" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble/Todo",
  a = { "<cmd>TodoTrouble<cr>", "All Todos in Project" },
  s = { "<cmd>TodoTelescope<cr>", "TodoTelescope all Projects" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

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
  "markdownlint",
  "marksman",
  "sumneko_lua",
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

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
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
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
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
  { command = "flake8", filetypes = { "python" } },
  { command = "shellcheck", filetypes = { "sh" } },
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

  -- NOTE: mappings = { "C-j", "C-k", "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  "karb94/neoscroll.nvim", -- a smooth scrolling neovim plugin written in lua

  -- NOTE: mappings s{motion}{char}, ss{char} (cursor), SS{char} (line)
  "kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease

  -- NOTE: used in "user.treesitter" in combination of "p00f/nvim-ts-rainbow"
  "lunarvim/darkplus.nvim",

  "MattesGroeger/vim-bookmarks", -- This vim plugin allows toggling bookmarks per line
  "ghillb/cybu.nvim", -- Neovim plugin that offers context when cycling buffers in the form of a customizable notification window.
  "moll/vim-bbye", -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  "windwp/nvim-spectre", -- search by rg and replace by sed
  "f-person/git-blame.nvim", -- git blame
  "folke/zen-mode.nvim", -- Distraction-free coding
  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  "hrsh7th/cmp-emoji", -- nvim-cmp source for emojis.
  -- in instert mode type : and collection of emojis pop up

  -- Leap is a general-purpose motion plugin for Neovim,
  -- with the ultimate goal of establishing a new standard interface for
  -- moving around in the visible area in Vim-like modal editors.
  "ggandor/leap.nvim",
  "nacro90/numb.nvim", -- numb.nvim is a Neovim plugin that peeks lines of the buffer in non-obtrusive way.
  "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "jinh0/eyeliner.nvim", -- Move faster with unique f/F indicators for each word on the line.
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
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
}

reload "user.neoscroll"
reload "user.cybu"
reload "user.surround"
reload "user.bookmark"
reload "user.zen-mode"
reload "user.inlay-hints"
-- reload "user.whichkey"
reload "user.telescope"
reload "user.bqf"
reload "user.numb"
reload "user.treesitter"
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
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
