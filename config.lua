-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>

-- NOTE: User Config for predefined plugins
lvim.builtin.terminal.direction = "tab"
-- NOTE: default lunarvim find_files wouldn't show hidden files
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<CR>", "Find Files" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

reload "user.neovide"
reload "user.plugins"
reload "user.treesitter"
reload "user.lsp"
reload "user.cybu"
reload "user.telescope"
reload "user.statusline"

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

-- NOTE BufNewFile, BufRead is triggered before FileType event
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'} , {
    pattern = { '*/templates/*.yaml', '*/templates/*.tpl', '*.gotmpl', 'helmfile*.yaml' },
    callback = function()
          vim.opt_local.filetype = 'helm'
    end
})

vim.g.python3_host_prog = '/Users/ENeuhaus/.venv/bin/python3'
