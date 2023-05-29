local plugins = {
    {
        'folke/trouble.nvim',
        lazy = false,
        config = function()
            require('trouble').setup()
        end,
    },

    {
        'phaazon/hop.nvim',
        lazy = false,
        config = function()
            require 'custom.configs.hop'
        end,
    },

    {
        'echasnovski/mini.nvim',
        lazy = false,
        config = function()
            require 'custom.configs.mini'
        end,
    },

    -- this opts will extend the default opts
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                'c',
                'go',
                'cpp',
                'vim',
                'lua',
                'rust',
                'bash',
                'python',
                'markdown',
                'javascript',
                'typescript',
                'markdown_inline',
            },
        },
    },

    -- if you load some function or module within your opt, wrap it with a function
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = function(...)
                            require("telescope.actions").close(...)
                        end,
                    },
                },
            },
        },
    },

    {
        'folke/which-key.nvim',
        -- keys = { "<leader>", '"', "'", "`", "c", "v" },
        init = function()
            require('core.utils').load_mappings 'whichkey'
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. 'whichkey')
            require("which-key").setup(opts)
        end,
    }
}

return plugins
