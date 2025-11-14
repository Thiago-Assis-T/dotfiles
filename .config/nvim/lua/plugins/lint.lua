return {
	{
		"mfussenegger/nvim-lint",
		opt = {
			linters_by_ft = {
				lua = { "luacheck" },
				php = { "phpstan" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
			},
		},
	},
}
