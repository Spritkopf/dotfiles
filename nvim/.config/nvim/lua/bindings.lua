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
wk.add({
    { "<leader>b", group = "[B]uffers" },
})

vim.keymap.set("n", "<leader>bc", ':bp|bd#<CR>', { desc = '[C]lose current buffer'})

-- Home key handling
-- Pressing Home goes to the first non-whitepsace character. 
-- If already there, pressing again goes to beginning of line

function CustomHomeKey()
  local col = vim.fn.col('.')
  local first_non_whitespace = vim.fn.match(vim.fn.getline('.'), '\\S')
  if col == first_non_whitespace + 1 then
    return "0"
  else
    return "^"
  end
end

-- Map the Home key to call the custom function
vim.keymap.set('n', '<Home>', ':lua vim.api.nvim_feedkeys(CustomHomeKey(), "n", true)<CR>', { noremap = true, silent = true })

-- Easy window navigation
vim.keymap.set('n', '<C-Right>', '<C-w><Right>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', '<C-w><Left>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w><Down>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>', '<C-w><Up>', { noremap = true, silent = true })


-- Multicursor edit (Crtl-D - like)
vim.keymap.set('n', '<leader>cg', '*``cgn', { noremap = true, silent = true })
vim.keymap.set('n', '<c-esc>', ':let @/=""<cr>', { noremap = true, silent = true })

-- Yanking and pasting to/from clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
