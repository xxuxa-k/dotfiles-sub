vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true, silent = true })
