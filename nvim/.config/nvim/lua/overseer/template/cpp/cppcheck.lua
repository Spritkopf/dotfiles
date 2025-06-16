-- Overseer tast template that executes Cppcheck in a docker container. Assumes the container image is tagged
-- with 'cppcheck:local'
return {
    name = "Cppcheck (Quickfix)",
    builder = function()
        local cwd = vim.fn.getcwd() -- Get the current working directory
        return {
            cmd = { "docker" },
            args = {
                "run",
                "--rm",
                "-it",
                "-v" .. cwd .. ":" .. cwd,
                "-w" .. cwd,
                "cppcheck:local",
                "cppcheck",
                "--project=build/compile_commands.json",
                "-itest",
                "-ilib",
                "--suppressions-list=cppcheck-suppression.txt",
                "--enable=all",
                "--inconclusive",
                "--inline-suppr",
            },

            components = {
                "default",
                {
                    "on_output_quickfix",
                    items_only = true,
                    open_on_match = true,
                    errorformat = "%f:%l:%m",
                },
            },
        }
    end,
}
