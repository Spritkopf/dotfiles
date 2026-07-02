return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    config = function()
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', { desc = "[E]xplorer (NeoTree)" })

        require 'window-picker'.setup({
            hint = 'floating-letter', })
    end
}
