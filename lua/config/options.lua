-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- Tab
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- misc
vim.opt.mousemoveevent = true
vim.opt.smartindent = true
vim.opt.autoread = true

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 15

-- LSP diagnostic
vim.diagnostic.config({
	virtual_lines = false,
})

vim.opt.updatetime = 500 -- 光标停留500毫秒后触发CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float({
			scope = "cursor",
			focusable = false,
			border = "single",
		})
	end,
})
