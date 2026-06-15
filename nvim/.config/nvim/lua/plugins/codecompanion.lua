return {
    {
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup({
                interactions = {
                    chat = {
                        -- You can specify an adapter by name and model (both ACP and HTTP)
                        adapter = {
                            name = "copilot",
                            model = "claude-sonnet-4.6",
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
            vim.keymap.set("n", "<leader>cc", function() require("codecompanion").toggle() end, { desc = "[C]hat" })
            vim.keymap.set("v", "<leader>cc", "<cmd>'<,'>CodeCompanionChat<CR>", { desc = "[C]hat about selection" })
            vim.keymap.set("v", "<leader>ci", "<cmd>'<,'>CodeCompanion<CR>", { desc = "[I]nline Code assistant" })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
    },
    {
        -- ---------------------------
        -- To renew the login token, use the plugin below and run :Copilot auth
        --
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({

                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<Tab>",
                        accept_line = "<S-Tab>",
                        accept_word = "<C-Right>",
                        next = "»",
                        prev = "«",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false },
            })

            vim.keymap.set("n", "<leader>ct", function() require("copilot.suggestion").toggle_auto_trigger() end,
                { desc = "Toggle Auto-[T]riggering of suggestions" })
            vim.keymap.set("i", "<Tab>", function()
                if require("copilot.suggestion").is_visible() then
                    require("copilot.suggestion").accept()
                else
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
                        "n",
                        false
                    )
                end
            end, { desc = "Accept Copilot suggestion or Tab" })
        end,
    },
}
