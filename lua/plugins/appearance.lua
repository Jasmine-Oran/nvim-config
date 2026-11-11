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
			custom_highlights = function(colors)
				return {
					["@variable.builtin"] = { fg = colors.red, italic = true },
					["@type.builtin"] = { fg = colors.mauve, italic = true },
					["@type.interface"] = { fg = colors.yellow, italic = true },
					["@type.super"] = { fg = colors.yellow, italic = true },
					["@lsp.type.enum"] = { fg = colors.teal, bold = true },
					["@lsp.typemod.class.declaration"] = { fg = colors.yellow, bold = true },
					["@lsp.typemod.class.definition"] = { fg = colors.yellow, bold = true },
				}
			end,
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
				diagnostics = "nvim_lsp", -- LSP indicators
				diagnostics_indicator = function(count, level)
					local icon = level == "error" and " " or " "
					return " " .. icon .. count
				end,
			},
		},
	},
}
