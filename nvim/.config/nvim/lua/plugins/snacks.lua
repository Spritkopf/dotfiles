return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        input = {},
        terminal = {},
        lazygit = {},
        indent = {
            scope = { enabled = false },
            animate = { enabled = false },
        },
        dashboard = {
            formats = {
                key = function(item)
                    return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                end,
            },
            preset = {
                header = table.concat({
                    "░▒█▄░▒█░▒█▀▀▀░▒█▀▀▀█░▒█░░▒█░▀█▀░▒█▀▄▀█",
                    "░▒█▒█▒█░▒█▀▀▀░▒█░░▒█░░▒█▒█░░▒█░░▒█▒█▒█",
                    "░▒█░░▀█░▒█▄▄▄░▒█▄▄▄█░░░▀▄▀░░▄█▄░▒█░░▒█",
                }, "\n"),
                keys = {
                    { key = "e", desc = "New file", action = ":ene | startinsert" },
                    { key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header", padding = 2 },
                { section = "keys", padding = 1 },
                { title = "MRU", padding = 1 },
                { section = "recent_files", limit = 8, padding = 1 },
                { title = "MRU " .. vim.fn.fnamemodify(".", ":~"), padding = 1 },
                { section = "recent_files", cwd = true, limit = 8, padding = 1 },
            },
        },
    },
    keys = {
        {
            "<c-;>",
            function() Snacks.terminal.toggle(nil, { win = { height = 20 } }) end,
            mode = { "n", "t" },
            desc = "Toggle terminal",
        },
        {
            "<leader>gg",
            function() Snacks.lazygit({ cwd = Snacks.git.get_root() }) end,
            desc = "Open Lazy[G]it",
        },
    },
    init = function()
        -- Window navigation from the shell terminal (not from lazygit etc., which use these keys)
        vim.api.nvim_create_autocmd("TermOpen", {
            group = vim.api.nvim_create_augroup("terminal_keymaps", {}),
            desc = "Terminal window navigation keymaps",
            callback = function(args)
                local st = vim.b[args.buf].snacks_terminal
                if st and st.cmd then
                    return
                end
                local opts = { buffer = args.buf }
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
            end,
        })
    end,
}
