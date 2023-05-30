-- n, v, i, t = mode names

local M = {}

M.disabled = {
    n = {
        ['<leader>fw'] = '',
        ['<leader>ma'] = '',
        ['<leader>pt'] = '',
        ['<leader>gt'] = '',
        ['<leader>cm'] = '',
        [']c'] = '',
        ['[c'] = '',
        ['<leader>rh'] = '',
        ['<leader>ph'] = '',
        ['<leader>gb'] = '',
        ['<leader>td'] = '',
        ['<leader>/'] = '',
        ['<leader>x'] = '',
        ['<leader>n'] = '',
        ['<leader>rn'] = '',
        ['gD'] = '',
        ['gd'] = '',
        ['K'] = '',
        ['gi'] = '',
        ['<leader>ls'] = '',
        ['<leader>D'] = '',
        ['<leader>ra'] = '',
        ['<leader>ca'] = '',
        ['gr'] = '',
        ['<leader>f'] = '',
        ['[d'] = '',
        [']d'] = '',
        ['<leader>q'] = '',
        ['<leader>fm'] = '',
        ['<leader>wa'] = '',
        ['<leader>wr'] = '',
        ['<leader>wl'] = '',
    },
    v = {
        ['<leader>/'] = '',
    },
}

M.general = {
    i = {
        -- go to  beginning and end
        ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
        ["<C-e>"] = { "<End>", "End of line" },

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "Move left" },
        ["<C-l>"] = { "<Right>", "Move right" },
        ["<C-j>"] = { "<Down>", "Move down" },
        ["<C-k>"] = { "<Up>", "Move up" },
    },

    n = {
        ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },

        -- save
        ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

        -- Copy all
        ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

        -- new buffer
        ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
        ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    },

    t = {
        ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    },

    v = {
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    },
}

M.tabufline = {
    plugin = true,

    n = {
        -- cycle through buffers
        ["<tab>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflineNext()
            end,
            "Goto next buffer",
        },

        ["<S-tab>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflinePrev()
            end,
            "Goto prev buffer",
        },

        -- close buffer + hide terminal buffer
        ["dx"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end,
            "Close buffer",
        },
    },
}

M.comment = {
    plugin = true,
}

M.lspconfig = {
    plugin = true,

    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    -- g = {
    --         name = "LSP Saga",
    --         r = { "<cmd>Lspsaga rename<CR>", "LSP Saga rename" },
    --         a = { "<cmd>Lspsaga code_action<CR>", "LSP Saga code_action" },
    --         f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Saga lsp_finder" },
    --         d = { "<cmd>Lspsaga goto_definition<CR>", "LSP Saga goto_definition" },
    --         p = { "<cmd>Lspsaga peek_definition<CR>", "LSP Saga peek_definition" },
    --         k = { "<cmd>Lspsaga hover_doc<CR>", "LSP Saga hover_doc" },
    n = {
        ["<leader>gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "LSP declaration",
        },

        ["<leader>gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "LSP definition",
        },

        ["<leader>gK"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "LSP hover",
        },

        ["<leader>gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "LSP implementation",
        },

        ["<leader>gs"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "LSP signature help",
        },

        ["<leader>gt"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "LSP definition type",
        },

        ["<leader>gR"] = {
            function()
                require("nvchad_ui.renamer").open()
            end,
            "LSP rename",
        },

        ["<leader>ga"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "LSP code action",
        },

        ["<leader>gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "LSP references",
        },

        ["<leader>gx"] = {
            function()
                vim.diagnostic.open_float { border = "rounded" }
            end,
            "Floating diagnostic",
        },

        ["<leader>gk"] = {
            function()
                vim.diagnostic.goto_prev({ float = { border = "rounded" }})
            end,
            "Goto prev",
        },

        ["<leader>gj"] = {
            function()
                vim.diagnostic.goto_next({ float = { border = "rounded" }})
            end,
            "Goto next",
        },

        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Diagnostic setloclist",
        },

        ["<leader>gf"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "LSP formatting",
        },

        -- ["<leader>ga"] = {
        --     function()
        --         vim.lsp.buf.add_workspace_folder()
        --     end,
        --     "Add workspace folder",
        -- },
        --
        -- ["<leader>wr"] = {
        --     function()
        --         vim.lsp.buf.remove_workspace_folder()
        --     end,
        --     "Remove workspace folder",
        -- },

        -- ["<leader>wl"] = {
        --     function()
        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --     end,
        --     "List workspace folders",
        -- },
    },
}

M.nvimtree = {
    plugin = true,

    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

        -- focus
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    },
}

M.telescope = {
    plugin = true,

    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
        ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
        ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
        ["<leader>fma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

        -- git
        ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
        ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

        -- pick a hidden term
        ["<leader>tt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    },
}

M.nvterm = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "Toggle vertical term",
        },
    },

    n = {
        -- toggle in normal mode
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "Toggle vertical term",
        },

        -- new
        ["<leader>h"] = {
            function()
                require("nvterm.terminal").new "horizontal"
            end,
            "New horizontal term",
        },

        ["<leader>v"] = {
            function()
                require("nvterm.terminal").new "vertical"
            end,
            "New vertical term",
        },
    },
}

M.whichkey = {
    plugin = true,

    n = {
        ['<leader>wK'] = {
            function()
                vim.cmd 'WhichKey'
            end,
            'Which-key all keymaps',
        },
        ['<leader>wk'] = {
            function()
                local input = vim.fn.input 'WhichKey: '
                vim.cmd('WhichKey ' .. input)
            end,
            'Which-key query lookup',
        },
    },
}

M.blankline = {
    plugin = true,

    n = {
        ['<leader>cc'] = {
            function()
                local ok, start = require 'indent_blankline.utils'.get_current_context(
                    vim.g.indent_blankline_context_patterns,
                    vim.g.indent_blankline_use_treesitter_scope
                )

                if ok then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                    vim.cmd [[normal! _]]
                end
            end,
            'Jump to current context',
        },
    },
}

M.gitsigns = {
    plugin = true,

    n = {
        -- Navigation through hunks
        ["<leader>hj"] = {
            function()
                if vim.wo.diff then
                    return "<leader>hj"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to next hunk",
            opts = { expr = true },
        },

        ["<leader>hk"] = {
            function()
                if vim.wo.diff then
                    return "<leader>hk"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to prev hunk",
            opts = { expr = true },
        },

        -- Actions
        ["<leader>hp"] = {
            function()
                require("gitsigns").preview_hunk()
            end,
            "Preview hunk",
        },

        ["<leader>hb"] = {
            function()
                require("gitsigns").blame_line{ full = true }
            end,
            "Blame line",
        },

        ["<leader>htb"] = {
            function()
                require("gitsigns").toggle_current_line_blame()
            end,
            "Toggle curren line blame",
        },

        ["<leader>htd"] = {
            function()
                require("gitsigns").toggle_deleted()
            end,
            "Toggle deleted",
        },

        ["<leader>hs"] = {
            function()
                require("gitsigns").stage_hunk()
            end,
            "Stage hunk",
        },

        ["<leader>hr"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },

        ["<leader>hS"] = {
            function()
                require("gitsigns").stage_buffer()
            end,
            "Stage buffer",
        },

        ["<leader>hR"] = {
            function()
                require("gitsigns").reset_buffer()
            end,
            "Reset buffer",
        },

        ["<leader>hu"] = {
            function()
                require("gitsigns").undo_stage_hunk()
            end,
            "Undo stage hunk",
        },

        ["<leader>hd"] = {
            function()
                require("gitsigns").diffthis()
            end,
            "Diff",
        },

        ["<leader>hD"] = {
            function()
                require("gitsigns").diffthis('~')
            end,
            "Diff HEAD",
        },
    },

    v = {
        ["<leader>hs"] = {
            function()
                require("gitsigns").stage_hunk()
            end,
            "Stage hunk",
        },

        ["<leader>hr"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },
    },
}

M.trouble = {
    plugin = true,

    n = {
        ["<leader>xx"] = {
            "<cmd>TroubleToggle<CR>",
            "Trouble toggle"
        },
        ["<leader>xw"] = {
            "<cmd>TroubleToggle workspace_diagnostics<CR>",
            "Trouble in workspace"
        },
        ["<leader>xd"] = {
            "<cmd>TroubleToggle document_diagnostics<CR>",
            "Trouble in current file"
        },
        ["<leader>xl"] = {
            "<cmd>TroubleToggle loclist<CR>",
            "Trouble location list"
        },
        ["<leader>xq"] = {
            "<cmd>TroubleToggle quickfix<CR>",
            "Trouble quickfix"
        },
        ["<leader>xr"] = {
            "<cmd>TroubleToggle lsp_references<CR>",
            "Trouble references"
        },
    }
}

return M