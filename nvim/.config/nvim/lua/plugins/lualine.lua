return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "dracula"
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1
                },
            },
        },
		
	},
}
