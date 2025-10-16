return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', 'Pipfile' },
    single_file_support = true,
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                pylsp_black = { enabled = true },
                pylsp_isort = { enabled = true },
                --isort = { enabled = true, profile = "black" },
                --
                -- linters
                pycodestyle = { enabled = false }, -- disable default PEP8
                pylsp_mypy = { enabled = false },  -- optional type checks
                pylsp_flake8 = { enabled = false }, -- disable old flake8
                pylsp_ruff = { enabled = true },   -- modern linter
            },
        },
    },
}
