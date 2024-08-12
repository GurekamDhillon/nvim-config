return {
	"mattn/emmet-vim",
	ft = { "html", "css", "javascriptreact", "typescriptreact" }, -- File types where Emmet should be enabled
	config = function()
		vim.g.user_emmet_leader_key = "<C-Z>" -- Change leader key for Emmet (optional)
	end,
}
