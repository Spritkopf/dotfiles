return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = { "markdown", "codecompanion" },
    opts = {},
    config = function()

        local wk = require("which-key")
        wk.add({
            { "<leader>v", group = "[V]iew" },
        })
        vim.keymap.set("n", "<leader>vm", "<cmd>RenderMarkdown toggle<CR>", {desc = "Toggle [M]arkdown rendering"})
    end
}
