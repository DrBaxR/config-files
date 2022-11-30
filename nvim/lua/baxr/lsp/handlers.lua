local M = {}

local keymap = vim.keymap.set
local diagnostic = vim.diagnostic
local opts = { noremap = true, silent = true }

-- Keymaps
-- diagnostics
local function diagnostics_keymaps()
    keymap('n', '[d', diagnostic.goto_prev, opts)
    keymap('n', ']d', diagnostic.goto_next, opts)
    keymap('n', '<leader>d', diagnostic.open_float, opts)
end

local function lsp_keymaps(bufopts)
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

-- On server attach
M.on_attach = function(client, bufnr)
    -- enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    diagnostics_keymaps()
    lsp_keymaps({ noremap = true, silent = true, buffer = bufnr })
end

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover)

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help)
end

return M
