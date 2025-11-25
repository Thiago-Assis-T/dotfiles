return {
	{
		"mfussenegger/nvim-lint",
		opt = {
			linters_by_ft = {
				lua = { "luacheck" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
			},
		},
	},
}
