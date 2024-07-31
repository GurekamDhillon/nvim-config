local M = {
	"neovim/nvim-lspconfig",
	config = function()
		lspconfig = require("lspconfig")

		lspconfig.gopls.setup({
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
					gofumpt = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						fieldTypes = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})
		lspconfig.html.setup({
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "htmldjango" },
			settings = {
				html = {
					suggest = {
						html5 = true,
					},
				},
			},
		})
		-- Setup TypeScript and JavaScript Language Server
		lspconfig.tsserver.setup({
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			settings = {
				typescript = {
					tsdk = "/path/to/your/typescript/lib", -- Optional: specify TypeScript SDK path
				},
			},
		})
	end,
	on_attach = function(client, bufnr)
		-- Keybindings for LSP features
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
		-- Add more keybindings as needed
	end,
}
return M
