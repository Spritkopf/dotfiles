return {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
        require("overseer").setup()
        require("overseer").load_template('cpp.cppcheck')

        local wk = require("which-key")
        wk.add({
            { "<leader>r", group = "[R]un Tasks" },
        })

        vim.keymap.set("n", "<leader>rr", ":OverseerRun<CR>", { desc = "[R]un Task" })
        vim.keymap.set("n", "<leader>rt", ":OverseerToggle<CR>", { desc = "[T]oggle output window" })
        vim.keymap.set("n", "<leader>rc", ":OverseerRunCmd<CR>", { desc = "Run raw shell [C]ommand" })
        vim.keymap.set("n", "<leader>rb", ":OverseerRun BUILD<CR>", { desc = "Run default [B]uild command" })
        vim.keymap.set("n", "<leader>qt", ":OverseerQuickAction open output in quickfix<CR>", { desc = "Open last Overseer [T]ask output in quickfix list" })
    end,
}
