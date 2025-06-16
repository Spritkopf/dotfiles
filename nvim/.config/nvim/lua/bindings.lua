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
