return {
    -- mason
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    -- mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "pylsp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })

            local wk = require("which-key")
            wk.add({
            { "<leader>l", group = "[L]SP" }, -- group
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to [D]efinition" })
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })
            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename symbol" })

        end,
    },
}
