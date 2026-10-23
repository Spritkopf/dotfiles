return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        indent = {
            scope = { enabled = true },
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
}
