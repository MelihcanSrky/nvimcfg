local lsp = require('lsp-zero').preset({})
local lsp_config = require("lspconfig")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup_servers({'tsserver', 'golangci_lint_ls', 'gopls', 'cssls', 'kotlin_language_server'})
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-k>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({select = false})
})

cmp_mappings['Tab'] = nil
cmp_mappings['S-Tab'] = nil

vim.diagnostic.config({
	virtual_text = true,
})

local on_attach = function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "<leader>pr", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>nx", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<C-i>", function() vim.diagnostic.setqflist() end, opts)

end

lsp.on_attach(on_attach)

lsp_config["dartls"].setup({
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern('.git'),
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("/opt/homebrew/"),
        vim.fn.expand("$HOME/tools/flutter/"),
      },
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
    }
  },
})

lsp.setup()

require("fidget").setup({})
