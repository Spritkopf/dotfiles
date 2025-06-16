return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find file in workspace" })
			vim.keymap.set("n", "<leader> ", builtin.buffers, { desc = "Find open buffers" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch: [G]rep over workspace" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

            vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Workspace [S]ymbols" })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document [S]ymbols" })

            vim.keymap.set("n", "gr", builtin.lsp_references, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
