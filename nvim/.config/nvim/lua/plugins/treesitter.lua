return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- this plugin does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            -- No-op for parsers that are already installed
            require("nvim-treesitter").install({
                "bash", "c", "cmake", "cpp", "groovy", "lua", "make",
                "markdown", "markdown_inline", "python", "rust", "toml", "yaml",
            })

            -- On the `main` branch highlighting is not enabled automatically
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_start", {}),
                desc = "Start treesitter highlighting",
                pattern = {
                    "bash", "sh", "c", "cmake", "cpp", "groovy", "lua", "make",
                    "markdown", "python", "rust", "toml", "yaml",
                },
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {}
        end,
    }
}
