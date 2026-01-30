vim.pack.add({
    'https://github.com/folke/tokyonight.nvim'
})
vim.cmd.colorscheme('tokyonight-night')
vim.cmd [[
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
]]
