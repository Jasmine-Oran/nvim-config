-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
		vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = event.buf, desc = "Find references" })
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = event.buf, desc = "Go to implementation" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename symbol" })
		vim.keymap.set(
			{ "n", "x" },
			"<leader>la",
			vim.lsp.buf.code_action,
			{ buffer = event.buf, desc = "Code action" }
		)
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { buffer = event.buf, desc = "Show diagnostic" })
	end,
})
