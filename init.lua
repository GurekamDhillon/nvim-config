require("config.lazy") -- loads lazy.vim

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.clipboard = "unnamedplus"

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":b#<CR>", { noremap = true, silent = true })

-- Function to close NvimTree if it's open
local function close_nvim_tree()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		vim.cmd("NvimTreeClose")
	end
end

-- Auto-command to close NvimTree on file open
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = close_nvim_tree,
	once = true, -- Close NvimTree only once when a file is opened
})
