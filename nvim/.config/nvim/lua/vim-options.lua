vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set scrolloff=8")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.cursorline = true


-- Navigate vim panes better
vim.keymap.set('n', '<c-Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-Right>', ':wincmd l<CR>')

-- Move and duplicate lines
vim.keymap.set('n', '<C-A-Up>', 'yyP')  -- duplicate line up
vim.keymap.set('n', '<C-A-Down>', 'yyp')  -- duplicate line down
vim.keymap.set('n', '<A-Up>', 'ddkP')  -- move line up
vim.keymap.set('n', '<A-Down>', 'ddp')  -- move line down
vim.keymap.set('v', '<C-A-Up>', ':co-1<CR>V\'[=gv')  -- copy visual block up
vim.keymap.set('v', '<C-A-Down>', ':co \'><CR>V\'[=gv')  -- copy visual block down
vim.keymap.set('v', '<A-Up>', ':m-2<CR>gv=gv')  -- move visual block up
vim.keymap.set('v', '<A-Down>', ':m\'>+<CR>gv=gv')  -- move visual block down

