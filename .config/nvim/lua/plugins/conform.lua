return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			["_"] = { "trim_whitespace" },
			lua = { "stylua", lsp_format = "fallback" },
			php = { "php_cs_fixer", lsp_format = "fallback" },
			bash = { "shfmt", lsp_format = "fallback" },
			sh = { "shfmt", lsp_format = "fallback" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
