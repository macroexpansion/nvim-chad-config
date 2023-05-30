local plugins = {
    'nvim-telescope/telescope.nvim',
    {
        "NvChad/nvterm",
        config = function(_, opts)
            require "base46.term"
            local new_opts = require 'custom.configs.nvterm'
            local merged_opts = vim.tbl_deep_extend('force', opts, new_opts)
            require("nvterm").setup(merged_opts)
        end,
    },
    {
        'folke/trouble.nvim',
        lazy = false,
        config = function()
            require 'trouble'.setup()
            require 'core.utils'.load_mappings 'trouble'
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
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        opts = function()
            local opt = require 'plugins.configs.cmp'
            local new_mapping = require 'custom.configs.cmp'
            return vim.tbl_deep_extend('force', opt, new_mapping)
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
                'yaml',
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
        'folke/which-key.nvim',
        init = function()
            require 'custom.mappings'
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. 'whichkey') -- whichkey theme
            -- local wk = require('which-key').setup(opts)
            local wk = require 'which-key'
            wk.register(require 'custom.configs.whichkey')
        end,
    },
    -- Download LSP server, linter, ... . Use :Mason to check plugings and :MasonInstallAll to install
    {
        'williamboman/mason.nvim',
        -- lazy = false,
        opts = {
            ensure_installed = {
                -- LSP server
                'rust-analyzer',
                'gopls',
                'pyright',
                'yaml-language-server',
            },
        },
    },
    -- LSP Config
    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'plugins.configs.lspconfig'
            require 'custom.configs.lspconfig'
        end,
    }
}

return plugins
