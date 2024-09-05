-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "go",
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

