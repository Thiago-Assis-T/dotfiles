vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = {
		menu = { border = "single" },
		documentation = { window = { border = "single" } },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	snippets = { preset = "luasnip" },
	signature = { enabled = true, window = { border = "single" } },
	fuzzy = { implementation = "lua" },
})
