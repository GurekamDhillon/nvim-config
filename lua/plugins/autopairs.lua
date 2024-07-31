local M = {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
		-- If using nvim-cmp, you can configure it to work with nvim-autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

return M
