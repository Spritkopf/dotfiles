return {
    "folke/snacks.nvim",
    lazy = false,

    priority = 1000,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        input = {},
        picker = {},
        explorer = {},
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
            "<leader>e",
            function()
                local explorer = Snacks.picker.get({ source = "explorer" })[1]
                if not explorer then
                    Snacks.explorer()
                elseif explorer:is_focused() then
                    explorer:close()
                else
                    Snacks.explorer.reveal()
                    explorer:focus("list")
                end
            end,
            desc = "[E]xplorer",
        },
        { "<C-p>", function() Snacks.picker.files({ hidden = true }) end, desc = "Find file in workspace" },
        { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Find open buffers" },
        { "<leader>sg", function() Snacks.picker.grep({ hidden = true }) end, desc = "[S]earch: [G]rep over workspace" },
        { "<leader>sw", function() Snacks.picker.grep_word({ hidden = true }) end, mode = { "n", "x" }, desc = "[S]earch current [W]ord" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
        { "<leader>s.", function() Snacks.picker.resume() end, desc = "Resume last Search" },
        { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace [S]ymbols" },
        { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "Document [S]ymbols" },
        { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Show [R]eferences" },
        { "gD", function() Snacks.picker.diagnostics() end, desc = "Show Diagnostics" },
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
    config = function(_, opts)
        require("snacks").setup(opts)
        require("which-key").add({
            { "<leader>s", group = "[S]earch" },
        })
    end,
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
