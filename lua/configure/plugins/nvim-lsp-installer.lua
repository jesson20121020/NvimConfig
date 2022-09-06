-- https://github.com/williamboman/nvim-lsp-installer

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local notices = require("utils.notices")

local lsp_installer_servers = require("nvim-lsp-installer.servers")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    vimls = require("configure.lsp.vimls"),
    sumneko_lua = require("configure.lsp.sumneko_lua"),
    pyright = require("configure.lsp.pyright"),
    clangd = require("configure.lsp.clangd")
}

local function disgnostic_settings()
    -- diagnostic style customization
    vim.diagnostic.config(
        {
            virtual_text=false,
            float = {
                source = "always"
            },
            update_in_insert = false
        }
    )
end

local function attach(client, bufnr)
    -- require("aerial").on_attach(client, bufnr)
end

-- automatically install or start LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- determine if the service is available
    if server_available then
        -- determine whether the service is ready, if it is ready, start the service
        server:on_ready(
            function()
                -- keybind
                server_options.on_attach = attach
                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- instead of built-in omnifunc
                server_options.capabilities = capabilities
                require('lspconfig')[server_name].setup{server_options}
            end
        )
        -- auto install if language server is not ready
        if not server:is_installed() then
            vim.notify(
                notices.language_server.download.message(server_name),
                notices.language_server.download.level,
                notices.language_server.download.options
            )
            server:install()
        end
    end
end

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', '<leader>gh', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', '<leader>gg', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
