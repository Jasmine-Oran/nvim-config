return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kkew3/jieba.vim",
		branch = "release",
		build = ":call jieba_vim#install()",
		init = function()
			vim.g.jieba_vim_keymap = 1
		end,
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			keymaps = {
				["<CR>"] = "actions.select",
				["<BS>"] = { "actions.parent", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				max_width = 0.7,
				max_height = 0.6,
				border = "single",
			},
		},
		keys = {
			{
				"<leader>o",
				function()
					require("oil").open_float()
				end,
				desc = "Oil",
			},
		},
	},
	{
		"malewicz1337/oil-git.nvim",
		ft = "oil",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
	{
		"ywpkwon/yank-path.nvim",
		config = function()
			require("yank-path").setup({
				prompt = "Yank which path?",
				use_oil = true,
			})
		end,
	},
	{
		"Fau818/fade.nvim",
		event = { "LspAttach", "InsertEnter" },
		opts = {},

		dependencies = {
			{ "Saghen/blink.cmp", optional = true },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = { mappings = false },
			spec = {
				{ "<leader>f", group = "Find" },
				{ "<leader>h", group = "Git hunk" },
				{ "gr", group = "LSP" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer keymaps",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle flash search",
			},
		},
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {
			foldKeymaps = { setup = false },
		},
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = true,
		},
		keys = {
			{
				"]h",
				function()
					require("gitsigns").next_hunk()
				end,
				desc = "Next hunk",
			},
			{
				"[h",
				function()
					require("gitsigns").prev_hunk()
				end,
				desc = "Previous hunk",
			},
			{
				"<leader>hh",
				function()
					require("gitsigns").preview_hunk_inline()
				end,
				desc = "Preview hunk inline",
			},
			{
				"<leader>hs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage/unstage hunk",
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			animate = { enabled = true },
			bigfile = { enabled = true },
			image = { enabled = true },
			indent = {
				enabled = true,
				indent = { char = "┊" },
				scope = { char = "│" },
				animate = {
					enabled = false,
				},
			},
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find file",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Find recent file",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find config file",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Search text",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Find diagnotics",
			},
			{
				"<leader>fD",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Find all diagnotics",
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "super-tab" },
			cmdline = {
				enabled = true,
				keymap = { preset = "inherit" },
				completion = {
					menu = {
						auto_show = function()
							return vim.fn.getcmdtype() == ":"
						end,
					},
				},
			},
			signature = { enabled = true },
			completion = {
				accept = { auto_brackets = { enabled = true } },
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
		},
	},
}
