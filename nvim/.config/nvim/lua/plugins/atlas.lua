return {
    "emrearmagan/atlas.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional but recommended
        "esmuellert/codediff.nvim", -- optional (PullRequest diff)
        -- "sindrets/diffview.nvim", -- optional; or "dlyongemallo/diffview-plus.nvim"
    },
    -- See Configuration below
    ---@type AtlasConfig
    opts = {
        providers = {
            ---@type AtlasGitLabConfig
            gitlab = {
                base_url = "https://gittf.ams-osram.info",
                -- Personal Access Token with `api` scope:
                -- token = vim.env.GITLAB_TOKEN,
                -- read token from a file (e.g. ~/.config/nvim/secret/gitlab_token):
                token = vim.fn.readfile(vim.env.HOME .. "/secret/gitlab_current_api_token.txt")[1],
                cache_ttl = 300, -- Set to 0 to disable caching.
            },


            ---@type AtlasJiraConfig
            -- jira = {
            --   base_url = "https://your-site.atlassian.net",
            --   email = "you@example.com", -- Required for basic authentication only.
            --   --- See: https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/
            --   token = "your_jira_api_token",
            --   auth_method = "basic", -- "basic" or "bearer", defaults to "basic". If using bearer, set `token` to your API token.
            --   api_type = "cloud", -- either "cloud" or "server", defaults to "cloud". Cloud API is v3, server API is v2
            --   cache_ttl = 300, -- Set to 0 to disable caching.
            -- },
        },
    },
}
