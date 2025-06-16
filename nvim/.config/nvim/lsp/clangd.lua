return {
    cmd = { 'clangd', '--background-index' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format', },
    filetypes = { 'c', 'cpp', 'h', 'hpp' },
}
