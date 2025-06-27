-- Overseer task template that executes validates a jenkinsfile with a POST request to the pipeline linter
return {
    name = "Validate Jenkinsfile",
    builder = function()
        local cwd = vim.fn.getcwd() -- Get the current working directory

        -- Read the contents of the Jenkinsfile
        local file = io.open("Jenkinsfile", "r")
        if not file then
            error("Could not open Jenkinsfile")
        end
        local jenkinsfile_content = file:read("*a")
        file:close()

        return {
            cmd = { "curl" },
            args = {
                "-k",
                "--user", os.getenv("JENKINS_VALIDATOR_USER") .. ":" .. os.getenv("JENKINS_VALIDATOR_PASS"),
                "-X", "POST",
                "-F", "jenkinsfile=<Jenkinsfile", "https://" .. os.getenv("JENKINS_VALIDATOR_URL") .. "/pipeline-model-converter/validate"
            },
            stdin = jenkinsfile_content,
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
