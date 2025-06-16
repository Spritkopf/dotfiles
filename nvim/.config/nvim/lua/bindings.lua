-- Move and duplicate lines
vim.keymap.set('n', '<C-A-Up>', 'yyP')  -- duplicate line up
vim.keymap.set('n', '<C-A-Down>', 'yyp')  -- duplicate line down
vim.keymap.set('n', '<A-Up>', 'ddkP')  -- move line up
vim.keymap.set('n', '<A-Down>', 'ddp')  -- move line down
vim.keymap.set('v', '<C-A-Up>', ':co-1<CR>V\'[=gv')  -- copy visual block up
vim.keymap.set('v', '<C-A-Down>', ':co \'><CR>V\'[=gv')  -- copy visual block down
vim.keymap.set('v', '<A-Up>', ':m-2<CR>gv=gv')  -- move visual block up
vim.keymap.set('v', '<A-Down>', ':m\'>+<CR>gv=gv')  -- move visual block down

-- Buffer handling

local wk = require("which-key")
wk.register({
    b = {
        name = "[B]uffers",
    }
}, { prefix = "<leader>" })

vim.keymap.set("n", "<leader>bc", ':bp|bd#<CR>', { desc = '[C]lose current buffer'})
