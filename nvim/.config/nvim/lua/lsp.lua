--
-- Enable LSPs
--
vim.lsp.enable({ 'lua', "clangd", "cmake", "toml" })


-- 
-- LSP Keymaps
--
local wk = require("which-key")
wk.add({
    { "<leader>l", group = "[L]SP" }, -- group
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to [D]efinition" })
-- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })  -- replaced with nvim default map 'gra'
vim.keymap.set({ 'n', 'v' }, "<leader>lf", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
-- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename symbol" })   -- replaced with nvim default map 'grn'
vim.keymap.set("n", "<leader>lh",
    function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inline [H]ints" })

--
-- Diagnostic configuration
--
vim.diagnostic.config(
    {
        underline = false,
        virtual_text = {
            spacing = 2,
            prefix = "●",
        },
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                -- Alas nerdfont icons don't render properly on Medium!
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.HINT] = " ",
                [vim.diagnostic.severity.INFO] = " ",
            },
        },
    }
)

-- toggle virtual lines for diagnostics on the current line only
local virtual_lines_enabled = false

-- Toggle function
local function toggle_virtual_lines()
    if virtual_lines_enabled then
        vim.diagnostic.config({ virtual_lines = false })
        virtual_lines_enabled = false
    else
        vim.diagnostic.config({ virtual_lines = { current_line = true } })
        virtual_lines_enabled = true
    end
end


vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
    { desc = "Show current line [D]iagnostic message" })
vim.keymap.set("n", "<leader>lD", toggle_virtual_lines, { desc = "Toggle virtual lines for current line" })
