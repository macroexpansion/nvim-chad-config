return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- LSP server
        "black",
        "delve",
        "eslint_d",
        "gofumpt",
        "goimports",
        "golines",
        "gopls",
        "isort",
        "lua-language-server",
        "prettier",
        "pyright",
        "rust-analyzer",
        "stylua",
        "yaml-language-server",
      },
      automatic_installation = true,
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    opts = function()
      local opt = require "nvchad.configs.cmp"
      local new_mapping = require "configs.cmp"
      return vim.tbl_deep_extend("force", opt, new_mapping)
    end,
    dependencies = {
      { "hrsh7th/cmp-cmdline" },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local opts = require "nvchad.configs.nvimtree"
      local new_opts = require "configs.nvimtree"
      local merged_opts = vim.tbl_deep_extend("force", opts, new_opts)
      return merged_opts
    end,
  },

  -- NOTE: note
  -- FIX: fix
  -- TODO: todo
  -- WARNING: todo
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
    lazy = false,
    config = function()
      require "configs.mini"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "go",
        "cpp",
        "vim",
        "lua",
        "yaml",
        "rust",
        "bash",
        "python",
        "prisma",
        "markdown",
        "javascript",
        "typescript",
        "markdown_inline",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<C-s>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require "configs.textobjects"
    end,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  -- LSP Saga
  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
          enable_in_insert = false,
        },
        ui = {
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
          border = "solid",
        },
      }
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
      { "catppuccin/nvim" },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- lazy = false,
    config = function()
      require "configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        multi_window = false,
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
          multi_line = true,
        },
      },
      label = {
        uppercase = false,
        rainbow = {
          enabled = true,
          shade = 9,
        },
      },
    },
    keys = {
      {
        "<leader>vs",
        mode = { "n" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<leader>vS",
        mode = { "n" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<leader>fl",
        mode = { "n" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "hadronized/hop.nvim",
    lazy = false,
    config = function()
      require "configs.hop"
    end,
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    config = function()
      require "configs.oil"
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
