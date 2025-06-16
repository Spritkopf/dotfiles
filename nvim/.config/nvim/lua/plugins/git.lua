return {
    {
        "lewis6991/gitsigns.nvim",

        config = function ()
            local gitsigns = require("gitsigns")
            gitsigns.setup({
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 0,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                }
            })
            vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline,  { desc = "[P]review Hunk" })
            vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame,  { desc = "Toggle [B]lame" })
            vim.keymap.set("n", "<leader>ga", gitsigns.stage_hunk,  { desc = "[A]ccept (stage) Hunk" })
            vim.keymap.set("n", "<leader>gd", gitsigns.reset_hunk,  { desc = "[D]iscard Hunk" })
        end
    }
}
