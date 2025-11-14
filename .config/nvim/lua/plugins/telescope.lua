return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = { file_ignore_patterns = { "node_modules", "vendor" } },
	},
}
