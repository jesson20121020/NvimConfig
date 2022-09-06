-- https://github.com/akinsho/bufferline.nvim

local icons = require("utils.icons")

-- file types not shown in bufferline
local filter_bufname = {
    "translate",
    "repl",
    "dbout"
}

require("bufferline").setup(
    {
        options = {
            -- diagnostics source
            diagnostics = "nvim_lsp",
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon'
            },
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            -- split style："slant" | "thick" | "thin"
            separator_style = "thick",
            -- show diagnostics icons
            ---@diagnostic disable-next-line: unused-local
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local c = ""
                if diagnostics_dict.error then
                    c = c .. icons.diagnostics.error .. diagnostics_dict.error
                elseif diagnostics_dict.warning then
                    c = c .. icons.diagnostics.warning .. diagnostics_dict.warning
                elseif diagnostics_dict.info then
                    c = c .. icons.diagnostics.info .. diagnostics_dict.info
                elseif diagnostics_dict.hint then
                    c = c .. icons.diagnostics.hint .. diagnostics_dict.hint
                end
                return c
            end,
            custom_filter = function(buf_number, _)
                local buf_name = vim.fn.bufname(buf_number)
                for _, name in ipairs(filter_bufname) do
                    if buf_name:find(name) then
                        return false
                    end
                end
                return true
            end,
            -- The left side yields the position of the NvimTree
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "undotree",
                    text = "History Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "BufferDirectory",
                    text_align = "center"
                }
            }
        },
        highlights = {
            -- xxx_        : The focus is not on the buffer, and the buffer is not selected
            -- xxx_visible : The focus is not on the buffer, but the buffer is selected
            -- xxx_selected: The buffer is selected, and the focus is on the buffer
            fill = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLineNC"}
            },
            background = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            buffer_visible = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            buffer_selected = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            separator = {
                fg = {attribute = "bg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            separator_selected = {
                fg = {attribute = "fg", highlight = "Special"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            separator_visible = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLineNC"}
            },
            close_button = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            close_button_selected = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            close_button_visible = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- split small vertical line on the left
            indicator_selected = {
                fg = {attribute = "fg", highlight = "BufferIndicator"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- How to distinguish styles after opening a file with the same name
            duplicate = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            duplicate_selected = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            duplicate_visible = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- the small dot when it is not saved
            modified = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            modified_visible = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            modified_selected = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- diagnotics
            diagnostic = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            diagnostic_visible = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            diagnostic_selected = {
                fg = {attribute = "fg", highlight = "Normal"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            },
            -- hint
            hint = {
                -- If you want to keep the diagnostic color when switching other windows, use the following comment configuration
                -- fg = {attribute = "fg", highlight = "DiagnosticHint"},
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticHint"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            hint_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticHint"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            hint_diagnostic = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_diagnostic_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticHint"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            hint_diagnostic_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticHint"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- info
            info = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticInfo"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            info_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticInfo"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            info_diagnostic = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_diagnostic_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticInfo"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            info_diagnostic_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticInfo"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- warning
            warning = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticWarn"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            warning_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticWarn"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            warning_diagnostic = {
                -- fg = {attribute = "fg", highlight = "DiagnosticWarn"},
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_diagnostic_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticWarn"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            warning_diagnostic_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticWarn"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- error
            error = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticError"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            error_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticError"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            error_diagnostic = {
                fg = {attribute = "fg", highlight = "StatusLineNC"},
                bg = {attribute = "bg", highlight = "StatusLine"},
                sp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_diagnostic_selected = {
                fg = {attribute = "fg", highlight = "DiagnosticError"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            error_diagnostic_visible = {
                fg = {attribute = "fg", highlight = "DiagnosticError"},
                bg = {attribute = "bg", highlight = "Normal"}
            },
            -- character number to go to buffer
            pick = {
                fg = {attribute = "fg", highlight = "DiagnosticError"},
                bg = {attribute = "bg", highlight = "StatusLine"}
            }
        }
    }
)
