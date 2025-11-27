vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/nvimtools/none-ls-extras.nvim" },
	{ src = "https://github.com/gbprod/none-ls-php.nvim" },
})
local null_ls = require("null-ls")
local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = function(client, bufnr)
	-- workspace diagnostics
	vim.lsp.buf.workspace_diagnostics({ client })
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
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format()
		end, opts) -- Note: formatting() was also deprecated
	end
end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"selene",
		"phpactor",
		"phpstan",
		"php-cs-fixer",
		"ts_ls",
		"prettierd",
		"eslint_d",
	},
})
vim.lsp.config("tsserver", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.config("phpactor", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
		init_options = {
			["language_server_phpstan.enabled"] = true,
			["language_server_php_cs_fixer.enabled"] = true,
		},
	},
})
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
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
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.phpstan,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.prettierd,
		-- require("none-ls-php.diagnostics.php"),
	},
})
