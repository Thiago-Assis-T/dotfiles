vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.config('phpactor', {
    init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_psalm.enabled"] = false,
    }
}
)
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

local servers = { 'bashls', 'phpactor', 'lua_ls', 'clangd', 'zls', 'gopls' }

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- LSP keymaps and autocmds setup
local function setup_lsp_keymaps()
    local lsp_attach_group = vim.api.nvim_create_augroup('lsp-attach-keymaps', { clear = true })

    vim.api.nvim_create_autocmd('LspAttach', {
        group = lsp_attach_group,
        callback = function(event)
            local bufnr = event.buf
            local client = vim.lsp.get_client_by_id(event.data.client_id)

            -- Helper function to create LSP keymaps
            local function map(mode, lhs, rhs, desc)
                local opts = { buffer = bufnr, desc = desc }
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Rename variable under cursor
            map('n', 'grn', vim.lsp.buf.rename, 'LSP: Rename')

            -- Code actions
            map({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, 'LSP: Code Action')

            -- Go to references
            if pcall(require, 'telescope.builtin') then
                map('n', 'grr', require('telescope.builtin').lsp_references, 'LSP: References')
            else
                map('n', 'grr', vim.lsp.buf.references, 'LSP: References')
            end

            -- Go to implementation
            if pcall(require, 'telescope.builtin') then
                map('n', 'gri', require('telescope.builtin').lsp_implementations, 'LSP: Implementations')
            else
                map('n', 'gri', vim.lsp.buf.implementation, 'LSP: Implementations')
            end

            -- Go to definition
            if pcall(require, 'telescope.builtin') then
                map('n', 'grd', require('telescope.builtin').lsp_definitions, 'LSP: Definitions')
            else
                map('n', 'grd', vim.lsp.buf.definition, 'LSP: Definitions')
            end

            -- Go to declaration
            map('n', 'grD', vim.lsp.buf.declaration, 'LSP: Declaration')

            -- Document symbols
            if pcall(require, 'telescope.builtin') then
                map('n', 'gO', require('telescope.builtin').lsp_document_symbols, 'LSP: Document Symbols')
            end

            -- Workspace symbols
            if pcall(require, 'telescope.builtin') then
                map('n', 'gW', require('telescope.builtin').lsp_workspace_symbols, 'LSP: Workspace Symbols')
            end

            -- Type definition
            if pcall(require, 'telescope.builtin') then
                map('n', 'grt', require('telescope.builtin').lsp_type_definitions, 'LSP: Type Definitions')
            else
                map('n', 'grt', vim.lsp.buf.type_definition, 'LSP: Type Definitions')
            end

            -- Additional useful LSP mappings
            map('n', 'K', vim.lsp.buf.hover, 'LSP: Hover')
            map('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to Declaration')
            map('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code Action')
            map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: Format')
            map('n', '<leader>cr', vim.lsp.buf.rename, 'LSP: Rename')
            map('n', '<leader>cd', vim.diagnostic.open_float, 'LSP: Show Diagnostic')
            map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'LSP: Previous Diagnostic')
            map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'LSP: Next Diagnostic')

            -- Document highlight setup (if supported)
            if client and client:supports_method('textDocument/documentHighlight') then
                local highlight_group = vim.api.nvim_create_augroup('lsp-document-highlight', { clear = false })

                vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    group = highlight_group,
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    group = highlight_group,
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })

                -- Clean up on LSP detach
                vim.api.nvim_create_autocmd('LspDetach', {
                    group = lsp_attach_group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds({ group = 'lsp-document-highlight', buffer = bufnr })
                    end,
                })
            end

            -- Inlay hints toggle (if supported)
            if client and client:supports_method('textDocument/inlayHint') then
                map('n', '<leader>th', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, 'Toggle Inlay Hints')
            end
        end,
    })
end

-- Initialize LSP keymaps
setup_lsp_keymaps()
