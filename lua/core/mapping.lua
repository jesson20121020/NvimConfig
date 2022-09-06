-- vim.g.mapleader = " "

local mapping = {}

mapping.register = function(range, gruop_name, bufnr)
    local group_keymap = mapping[range][gruop_name]
    for _, key_map in ipairs(group_keymap) do
        -- noremap : default = true
        local options = {
            buffer = bufnr
        }
        if key_map[4] then
            for opt in vim.gsplit(key_map[4], "|", true) do
                options[opt] = true
            end
        end
        vim.keymap.set(key_map[1], key_map[2], key_map[3], options)
    end
end

mapping.global = {
    nvim_spectre = {
        {{"n"}, "<leader>rp", "<cmd>lua require('spectre').open()<cr>", "silent"},
        {{"n"}, "<leader>rf", "viw:lua require('spectre').open_file_search()<cr>", "silent"},
        {{"n"}, "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "silent"}
    },
    nvim_tree = {
        {{"n"}, "<F2>", "<cmd>NvimTreeToggle<cr>", "silent"},
    },
    undotree = {
        {{"n"}, "<F3>", ":UndotreeToggle<cr>", "silent"}
    },
    todo_comments = {
        {"n", "<leader>fd", "<cmd>TodoTelescope theme=dropdown<cr>", "silent"}
    },
    neoformat = {
        {{"n"}, "<F4>", "<cmd>Neoformat<cr>", "silent"}
    },
    vim_vsnip = {
        {{"i", "s"}, "<C-k>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "expr|silent"},
        {{"i", "s"}, "<C-j>", "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'", "expr|silent"}
    },
    toggleterm = {
        {{"n"}, "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "silent"},
    },
    bufferline = {
        {{"n"}, "gt", "<cmd>BufferLineCycleNext<cr>", "silent"},
    },
    nvim_dap = {
        {{"n"}, "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "silent"},
        {
            {"n"},
            "<leader>dB",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
            "silent"
        },
        {{"n"}, "<leader>dc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", "silent"},
        {{"n"}, "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "silent"},
        {{"n"}, "<leader>dh", "<cmd>lua require'dapui'.eval()<cr>", "silent"},
        {{"n"}, "<F5>", "<cmd>lua require'dap'.continue()<cr>", "silent"},
        {{"n"}, "<F6>", "<cmd>lua require'dap'.step_into()<cr>", "silent"},
        {{"n"}, "<F7>", "<cmd>lua require'dap'.step_over()<cr>", "silent"},
        {{"n"}, "<F8>", "<cmd>lua require'dap'.step_out()<cr>", "silent"},
        {{"n"}, "<F9>", "<cmd>lua require'dap'.run_last()<cr>", "silent"},
        {{"n"}, "<F10>", "<cmd>lua require'dap'.terminate()<cr>", "silent"}
    },
    nvim_notify = {
        {
            {"n"},
            "<leader>fn",
            "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    },
    telescope = {
        {
            {"n"},
            "<C-P>",
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<S-F>",
            "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<C-F>",
            "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    },
    aerial ={
        {
            {"n"},
            "<C-y>",
            "<cmd>lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    }
}
mapping.buffer = {
    nvim_lsp_installer = {
        {
            {"n"},
            "<leader>gg",
            "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>gr",
            "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>go",
            "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>ca",
            "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "gd",
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            "silent"
        },
        {{"n"}, "K", "<cmd>Lspsaga hover_doc<cr>", "silent"},
        {{"n"}, "<leader>cn", "<cmd>Lspsaga rename<cr>", "silent"}
    },
    aerial = {
        {{"n"}, "<F8>", "<cmd>AerialToggle! right<cr>", "silent"},
    },
    gitsigns = {
        {{"n"}, "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", "expr|silent"},
        {{"n"}, "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", "expr|silent"},
        {{"n"}, "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "silent"},
        {{"n"}, "<leader>gh", "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>", "silent"},
        {{"n"}, "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", "silent"},
        {{"n"}, "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", "silent"},
        {{"n"}, "<leader>gv", "<cmd>Gitsigns diffthis<cr>", "silent"},
        {{"n", "v"}, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "silent"}
    }
}

mapping.plugin = {
    lsp_signature = {
        toggle_key = "<c-p>"
    },
    lspsaga = {
        quit = "<esc>",
        exec = "<cr>"
    },
    telescope_buffer = {
        insert_del_buf = "<c-d>",
        noremal_del_buf = "dd"
    },
    nvim_neoclip = {
        confirm_select = "<cr>",
        insert_delete_yank = "<c-d>",
        noremal_delete_yank = "dd"
    },
    nvim_cmp = {
        prev_item = "<c-k>",
        next_item = "<c-j>",
        next_item2 = "<tab>",
        confirm = "<cr>",
        next_item_or_confirm = "<space>",
        prev_5_item = "<c-u>",
        next_5_item = "<c-d>",
        toggle_complete = "<c-p>",
        prev_scroll = "<c-b>",
        next_scroll = "<c-f>"
    },
    nvim_treesitter = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        node_decremental = "<bs>",
        scope_incremental = "<tab>"
    },
    nvim_spectre = {
        toggle_line = "dd",
        select_entry = "<cr>",
        show_option_menu = "<leader>o",
        run_replace = "<leader>r",
        change_view_mode = "<leader>v"
    },
    comment = {
        normal_line_toggle = "gcc",
        normal_block_toggle = "gCC",
        visual_line_toggle = "gc",
        visual_block_toggle = "gC"
    },
    toggleterm = {
        exit_insert = "<esc>",
        lazy_git_exit_insert = "q",
        float_exit_insert = "<esc>"
    }
}

return mapping
