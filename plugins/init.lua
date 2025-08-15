return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- event = "BufReadPre",
    config = true,
    keys = {
      -- { "<leader>ca", nil, desc = "AI/Claude Code" },
      { "<leader>cac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>caf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>car", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>caC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>cam", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>cab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>cas", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>cas",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>caa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>cad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  {
    "pmizio/typescript-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local opt = require "nvchad.configs.telescope"
      local new_mapping = require "configs.telescope"
      return vim.tbl_deep_extend("force", opt, new_mapping)
    end,
  },

  {
    "nvchad/base46",
    version = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "folke/snacks.nvim",
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },

          {
            pane = 2,
            section = "terminal",
            cmd = 'echo "Hello, $USER !"',
            height = 7,
            padding = 1,
          },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
  },

  {
    -- save to ~/.local/state/nvim/sessions/
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  {
    "mason-org/mason.nvim",
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
    opts = require "configs.conform-nvim",
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
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
  -- INFO: info
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      dofile(vim.g.base46_cache .. "trouble")
      require("trouble").setup()
    end,
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
    event = "BufReadPre",
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
        callhierarchy = {
          layout = "normal",
          keys = {
            edit = "o",
          },
        },
        finder = {
          layout = "normal",
        },
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
    config = function()
      require "configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "flash")
      require("flash").setup(opts)
    end,
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
      dofile(vim.g.base46_cache .. "hop")
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

  {
    "refractalize/oil-git-status.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.oil-git-status"
    end,
    dependencies = {
      "stevearc/oil.nvim",
    },
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require "configs.copilot"
  --   end,
  -- },

  {
    "saghen/blink.cmp",
    lazy = false,
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot", "ray-x/cmp-sql" },
    config = function()
      dofile(vim.g.base46_cache .. "blink")
      require "configs.blink"
    end,

    -- use a release tag to download pre-built binaries
    version = "1.*",
    opts_extend = { "sources.default" },
  },

  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },

  {
    "augmentcode/augment.vim",
    event = "BufReadPre",
    branch = "prerelease",
  },

  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    version = "v2.1.0",
    opts = {
      default_mappings = false, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = "copen", -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "GitConflictDiffAdd",
        current = "GitConflictDiffText",
      },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git-conflict")
      require("git-conflict").setup(opts)
    end,
  },

  -- {
  --   "akinsho/bufferline.nvim",
  --   lazy = false,
  --   version = "v4.9.1",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   opts = {
  --     options = {
  --       offsets = {
  --         {
  --           filetype = "NvimTree",
  --           text = "File Explorer",
  --           highlight = "Directory",
  --           text_align = "left",
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. "bufferline")
  --     require("bufferline").setup(opts)
  --   end,
  -- },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "diffview")
      require("diffview").setup(opts)
    end,
  },
}
