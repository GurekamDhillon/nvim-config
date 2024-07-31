return {
	"junegunn/fzf.vim",
	dependencies = {
		"junegunn/fzf", -- Ensure fzf binary is installed
	},
	config = function()
		-- Set key mappings for fzf
		vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-t>", ":Tags<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-g>", ":Rg<CR>", { noremap = true, silent = true })
	end,
}
