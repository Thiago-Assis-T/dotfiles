vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
local servers = { 'lua_ls', 'clangd', 'dartls'}

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

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


