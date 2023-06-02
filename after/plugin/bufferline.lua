vim.opt.termguicolors = true
require("bufferline").setup{}

vim.keymap.set('n', '<leader>mm', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>mn', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>mp', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>cp', '<CMD>BufferLinePickClose<CR>')
