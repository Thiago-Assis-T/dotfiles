return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"bashls",
			"codespell",
			"stylua",
			"luacheck",
			"php_cs_fixer",
			"phpstan",
			"shfmt",
			"shellcheck",
			"phpactor",
			"lua_ls",
		},
	},
}
