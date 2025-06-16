return {
    {
        "akinsho/toggleterm.nvim",

        config = function()
            require("toggleterm").setup{
                open_mapping = [[<c-ö>]],
                size = 20
            }

            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

            local wk = require("which-key")
            wk.add({
                { "<leader>t", group = "[T]erminal" }
            })

            vim.keymap.set("n", "<leader>tt", ":TermSelect<CR>",  { desc = "Show list of terminals" })

            -- Custom terminal for Lazygit

            local Terminal  = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir",
                direction = "float",
                float_opts = {
                    border = "double",
                },
                hidden = true,
                -- function to run on opening the terminal
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-esc>", "<esc>", {noremap = true, silent = true})
                end,
                -- function to run on closing the terminal
                on_close = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            function _G.lazygit_toggle()
                lazygit:toggle()
            end

            wk.add({
                { "<leader>g", group = "[G]it" }
            })
            vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Open Lazygit" })

         end

    }
}
