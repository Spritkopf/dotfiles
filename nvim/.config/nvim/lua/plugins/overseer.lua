return {
    'stevearc/overseer.nvim',
    opts = {},
    config = function()
        require('overseer').setup()


        local wk = require("which-key")
        wk.register({
            t = {
                name = "[T]asks",
            }
        }, { prefix = "<leader>" })

        vim.keymap.set("n", "<leader>tr", ':OverseerRun<CR>',  { desc = "[R]un Task" })
        vim.keymap.set("n", "<leader>tt", ':OverseerToggle<CR>', { desc = "[T]oggle output window" })
        vim.keymap.set("n", "<leader>tc", ':OverseerRunCmd<CR>', { desc = "Run raw shell [C]ommand" })
        vim.keymap.set("n", "<leader>tb", ':OverseerRun BUILD<CR>', { desc = "Run default [B]uild command" })
    end
}
