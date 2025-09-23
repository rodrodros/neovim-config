return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
		},
		ops = function(_, opts)
			if not vim.g.trouble_lualine then
				table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
			end
		end,
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = false,
					disabled_filetypes = {
						"NvimTree",
					},
					extensions = {
						"fugitive",
						"nvim-tree",
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim", -- To use delete command
		},
		opts = {
			diagnostics = "nvim_lsp",
			close_command = "Bdelete! %d", -- using bufdelete dependency
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					syte_preset = {
						bufferline.style_preset.default,
					},
					separator_style = "slant",
					-- offsets = {
					-- 	{
					-- 		text = "File Explorer",
					-- 		filetype = "NvimTree",
					-- 		separator = true,
					-- 		highlight = "Directory",
					-- 	},
					-- },
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
			})
			-- BufferLine (move buffers around)
			vim.keymap.set("n", "<leader>d", "<Cmd>Bdelete<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bb", "<Cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "˜", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "π", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
		end,
	},
	-- Needs configuration with the LSP
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	dependencies = {
	-- 		"nvim-lspconfig",
	-- 	},
	-- 	lazy = true,
	-- 	init = function()
	-- 		-- vim.g.navic_silenece = true
	-- 		local lazyvim = require("lazyvim.util")
	-- 		lazyvim.lsp.on_attach(function(client, buffer)
	-- 			if client.supports_method("textDocument/documentSymbol") then
	-- 				require("nvim-navic").attach(client, buffer)
	-- 			end
	-- 		end)
	-- 	end,
	-- 	opts = function()
	-- 		return {
	-- 			separator = " ",
	-- 			highligh = true,
	-- 			depth_limit = 5,
	-- 			-- icons = LazyVim.config.icons.kinds,
	-- 			lazy_update_context = true,
	-- 		}
	-- 	end,
	-- },
}
