return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		init = function()
			-- starts treesitter highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "rust" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
