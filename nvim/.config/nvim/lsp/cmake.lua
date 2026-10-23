return {
    cmd = { 'neocmakelsp', 'stdio' },
    filetypes = { 'cmake' },
    root_markers = { '.git' },
    single_file_support = true,
    init_options = {
        format = { enable = true },
        lint = { enable = true },
        semantic_token = false, -- treesitter handles highlighting
    },
}
