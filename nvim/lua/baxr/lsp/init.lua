-- Advertise nvim-cmp capabilities to the LSP's
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local diagnostic = vim.diagnostic

-- navigate to diagnostics
keymap('n', '[d', diagnostic.goto_prev, opts)
keymap('n', ']d', diagnostic.goto_next, opts)

-- Use these mappings only after server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local lsp_buf = vim.lsp.buf

    keymap('n', 'gD', lsp_buf.declaration, bufopts) -- go to declaration
    keymap('n', 'gd', lsp_buf.definition, bufopts) -- go to definition
    keymap('n', 'K', lsp_buf.hover, bufopts) -- hover cursor location
    keymap('n', '<C-k>', lsp_buf.signature_help, bufopts) -- signature help
    keymap('n', '<leader>D', lsp_buf.type_definition, bufopts) -- type definition
    keymap('n', '<leader>rn', lsp_buf.rename, bufopts) -- rename
    keymap('n', '<leader>ca', lsp_buf.code_action, bufopts) -- show all current code actions
    keymap('n', 'gr', lsp_buf.references, bufopts) -- show all references
    keymap('n', '<leader>f', function() lsp_buf.format { async = true } end, bufopts) -- format file

    -- mappings I don't understand
    --    keymap('n', '<leader>wa', lsp_buf.add_workspace_folder, bufopts)
    --    keymap('n', '<leader>wr', lsp_buf.remove_workspace_folder, bufopts)
    --    keymap('n', '<leader>wl', function() print(vim.inspect(lsp_buf.list_workspace_folders())) end, bufopts)
    --    keymap('n', 'gi', lsp_buf.implementation, bufopts)
end

-- flags for LSP
local lsp_flags = {
    debounce_text_changes = 150,
}

-- Lua LSP
require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
