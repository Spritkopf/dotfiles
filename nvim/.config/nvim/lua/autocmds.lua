vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('cd_on_dir_open', {}),
  desc = 'Set cwd when nvim is opened on a directory',
  callback = function()
    local arg = vim.fn.argv(0)
    if vim.fn.argc() == 1 and arg ~= '' and vim.fn.isdirectory(arg) == 1 then
      vim.cmd.cd(vim.fn.fnameescape(arg))
    end
  end,
})
