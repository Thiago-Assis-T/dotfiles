vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  {src = 'https://github.com/mason-org/mason.nvim'},
}
require("mason").setup()
vim.lsp.config('lua_ls', {
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})
vim.lsp.enable('lua_ls')

