return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
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
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "snacks_layout_box",
					},
				},
			},
		},
	},
}
