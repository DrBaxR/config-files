-- Advertise nvim-cmp capabilities to the LSP's
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local handlers = require("baxr.lsp.handlers")

handlers.setup();

-- flags for LSP
local lsp_flags = {
    debounce_text_changes = 150,
}

-- Lua LSP
require('lspconfig').sumneko_lua.setup {
    on_attach = handlers.on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = require('baxr.lsp.settings.sumneko_lua')
}
