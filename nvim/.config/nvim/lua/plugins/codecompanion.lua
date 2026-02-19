return {
    "olimorris/codecompanion.nvim",
    config = function()
        require("codecompanion").setup({
            interactions = {
                chat = {
                    -- You can specify an adapter by name and model (both ACP and HTTP)
                    adapter = {
                        name = "copilot",
                        model = "claude-sonnet-4.5",
                    },
                },
                -- Or, just specify the adapter by name
                inline = {
                    adapter = "copilot",
                },
                cmd = {
                    adapter = "copilot",
                },
            },
        })
        local wk = require("which-key")
        wk.add({
            { "<leader>c", group = "[C]odeCompanion" },
        })
        vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", { desc = "[C]hat" })
        vim.keymap.set("v", "<leader>cc", "<cmd>'<,'>CodeCompanionChat<CR>", { desc = "[C]hat about selection" })
        vim.keymap.set("v", "<leader>ci", "<cmd>'<,'>CodeCompanion<CR>", { desc = "[I]nline Code assistant" })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },


    -- ---------------------------
    -- To renew the login token, use the plugin below and run :Copilot auth
    --
    -- "zbirenbaum/copilot.lua",
    -- lazy = false,
    -- config = function()
    --     require("copilot").setup({})
    -- end,
}
