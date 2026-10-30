return {
	-- LSP
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = { vim.env.VIMRUNTIME } },
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "basedpyright", "lua_ls", "jsonls", "taplo", "yamlls" },
				automatic_enable = { "basedpyright", "lua_ls", "jsonls", "taplo", "yamlls" },
			})
		end,
	},

	-- language tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = { ensure_installed = { "black", "stylua" } },
	},

	-- formatters
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "black" },
				lua = { "stylua" },
				json = { lsp_format = "fallback" },
				jsonc = { lsp_format = "fallback" },
				toml = { lsp_format = "fallback" },
				yaml = { lsp_format = "fallback" },
			},
			format_on_save = { timeout_ms = 1000 },
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- install parsers
			require("nvim-treesitter").install({
				"python",
				"lua",
				"json",
				"toml",
				"yaml",
			})
			-- enable treesitter highlight
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "python", "lua", "json", "toml", "yaml" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
