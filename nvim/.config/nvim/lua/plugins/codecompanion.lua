return {
	"olimorris/codecompanion.nvim",
	config = function()
		require("codecompanion").setup({
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = "cmd: cat ~/secret/gemini.txt",
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
				},
			},
		})
        local wk = require("which-key")
        wk.add({
            { "<leader>c", group = "[C]odeCompanion" },
        })
        vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", {desc = "[C]hat"})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
