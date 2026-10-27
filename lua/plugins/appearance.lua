return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavor = "auto",
			background = {
				light = "frappe",
				dark = "mocha",
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			options = {
				parsers = { css = true },
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = "",
				component_separators = "",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				indicator = { style = "underline" },
				groups = {
					items = {
						{
							name = "Buffers",
							highlight = { underline = false, sp = "#6AC8F1" },
							matcher = function(buf)
								return buf.buftype == ""
							end,
						},
						{
							name = "Terminal",
							highlight = { underline = false, sp = "#A6E3A1" },
							matcher = function(buf)
								return buf.buftype == "terminal"
							end,
						},
					},
				},
				diagnostics = "nvim_lsp", -- LSP indicators
				offsets = {
					{
						filetype = "snacks_layout_box",
					},
				},
			},
		},
	},
}
