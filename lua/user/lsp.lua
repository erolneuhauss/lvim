-- generic LSP settings
-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls.
-- WARN: !!Requires `:LvimCacheReset` to take effect!!
-- :LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "tflint"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  "ansiblels",
  "bashls",
  "dockerls",
  "helm_ls",
  "jsonls",
  "lua_ls",
  "marksman",
  "terraformls",
  "texlab",
  "tflint",
  "yamlls",
}

require("lvim.lsp.manager").setup("marksman")

local lspconfig = require("lspconfig")

-- Extend bashls setup to also support zsh files
lspconfig.bashls.setup {
  -- Extending the filetypes to include 'zsh'
  filetypes = { "sh", "bash", "zsh" },
  on_attach = function(client, bufnr)
    -- Use LunarVim's default on_attach, if any customization needed
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
}

