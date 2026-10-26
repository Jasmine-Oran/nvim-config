-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mode switch
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
	end,
})

-- Terminal
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("terminal")
end, { desc = "Open terminal" })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
