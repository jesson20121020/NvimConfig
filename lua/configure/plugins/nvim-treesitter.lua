-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

require("nvim-treesitter.configs").setup(
    {
        -- installed highlight support sources
        ensure_installed = {"python", "c", "cpp", "lua", "vim", "java"},
        -- synchronous download highlighting support
        sync_install = false,
        -- highlight related
        highlight = {
            enable = true,
            -- disable built-in regex highlighting
            additional_vim_regex_highlighting = false
        },
        -- incremental selection
        incremental_selection = {
            enable = true,
        },
        -- indent have bug in python
        indent = {
            enable = false
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true
        }
    }
)
require('nvim-treesitter.install').compilers = { "clang" }

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
