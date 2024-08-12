local M = {
	"jose-elias-alvarez/null-ls.nvim", -- Plugin name
	dependencies = { "nvim-lua/plenary.nvim" }, -- Dependency for null-ls
	config = function()
		local null_ls = require("null-ls")

		-- Configuration for null-ls
		null_ls.setup({
			-- Define sources for null-ls
			sources = {
				-- Code format
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "javascript", "typescript", "json", "yaml" },
				}),
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.stylua,
			},
			-- Setup for LSP on_attach function
			on_attach = function(client, bufnr)
				-- Auto-format on save if the language server supports formatting
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}

return M
