vim.pack.add({
	{ src = "https://github.com/dracula/vim" },
  { src = "https://github.com/folke/todo-comments.nvim"},
})
vim.cmd.colorscheme("dracula")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

require("todo-comments").setup({})
