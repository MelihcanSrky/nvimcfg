-- examples for your init.lua
local api = require('nvim-tree.api')

local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>vt', api.node.open.vertical,                opts('Open: Vertical Split'))
vim.keymap.set('n', '<leader>ht', api.node.open.horizontal,              opts('Open: Horizontal Split'))
vim.keymap.set('n', '<S-Tab>', ":NvimTreeFindFileToggle<CR>", opts("Toggle"))
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
