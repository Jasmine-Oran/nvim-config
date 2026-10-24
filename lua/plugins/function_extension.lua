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
			},
		},
		keys = {
			{
				"<leader>o",
				function()
					require("oil").open()
				end,
				desc = "Oil",
			},
		},
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
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>f", group = "Find" },
				{ "<leader>h", group = "Hunk" },
				{ "<leader>l", group = "LSP" },
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
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = true,
		},
		keys = {
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
			{
				"<leader>hd",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diff current file",
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
			input = { enabled = true },
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
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "super-tab" },
			signature = { enabled = true },
		},
	},
}
