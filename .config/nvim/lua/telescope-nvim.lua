vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-telescope/telescope-fzy-native.nvim',
    'https://github.com/nvim-telescope/telescope-file-browser.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})
require('telescope').setup({
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    -- your custom insert mode mappings
                },
                ['n'] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
});
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
