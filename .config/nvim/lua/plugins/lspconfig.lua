return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
			})
			vim.lsp.enable("bashls")
			vim.lsp.config("bashls", {
				capabilities = capabilities,
				filetypes = { "bash", "sh" },
			})

			vim.lsp.enable("phpactor")
			vim.lsp.config("phpactor", {
				capabilities = capabilities,
				root_markers = { "composer.json", "php.ini", ".git" },
				filetypes = { "php" },
			})
		end,
	},
}
