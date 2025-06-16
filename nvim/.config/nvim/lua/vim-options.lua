vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set scrolloff=8")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false


-- Navigate vim panes better
vim.keymap.set('n', '<c-Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-Right>', ':wincmd l<CR>')

