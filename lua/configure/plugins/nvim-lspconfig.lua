local servers = {
    vimls = require("configure.lsp.vimls"),
    sumneko_lua = require("configure.lsp.sumneko_lua"),
    pyright = require("configure.lsp.pyright"),
    clangd = require("configure.lsp.clangd")
}

require'lspconfig'.pyright.setup{}

for server_name, server_options in pairs(servers) do
	require'lspconfig'.pyright.setup{}
    server:setup(server_options)
end
