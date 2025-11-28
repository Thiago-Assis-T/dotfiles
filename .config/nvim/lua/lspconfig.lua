vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/jay-babu/mason-null-ls.nvim" },
})
local null_ls = require("null-ls")
local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = function(client, bufnr)
	-- Key mappings
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
	end, opts)

	-- Check if the client supports formatting
	if client:supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
	vim.lsp.buf.workspace_diagnostics({ client })
end

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"phpactor",
		"cssls",
		"html",
	},
})
require("mason-null-ls").setup({
	automatic_installation = false,
	ensure_installed = {
		-- Lua:
		"stylua",
		"selene",
		-- PHP:
		"phpstan",
		"php-cs-fixer",
		"phpcs",
		"phpcbf",

		-- Web:
		"prettierd",
		"eslint_d",
		"htmlhint",
		"stylelint",
	},
	handlers = {},
})
vim.lsp.config("tsserver", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.config("phpactor", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		filetypes = { "php" },
		root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
	},
})
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		root_markers = { "stylua.toml", ".luarc.json", "init.lua", "selene.toml" },
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
null_ls.setup({
	null_ls.builtins.diagnostics.trail_space,
	null_ls.builtins.formatting.codespell,
	null_ls.builtins.diagnostics.codespell,
	null_ls.builtins.diagnostics.selene,
	null_ls.builtins.completion.spell,
})
