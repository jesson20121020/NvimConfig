-- https://github.com/ray-x/lsp_signature.nvim

local mapping = require("core.mapping")

require("lsp_signature").setup(
    {
        bind = true,
        -- border style
        handler_opts = {
            -- double、rounded、single、shadow、none
            border = "rounded"
        },
        -- auto trigger
        floating_window = true,
        -- bind keys
        toggle_key = mapping.plugin.lsp_signature.toggle_key,
        -- close hint message
        hint_enable = true,
        -- settings current parameter highlight
        hi_parameter = "LspSignatureActiveParameter"
    }
)
