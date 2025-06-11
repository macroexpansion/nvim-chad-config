-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- build = 'cargo build --release',
-- If you use nix, you can build from source using latest nightly rust with:
-- build = 'nix run .#build-plugin',

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup {
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = "enter",

    ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-j>"] = { "select_next", "fallback_to_mappings" },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = { auto_show = true },

    accept = { auto_brackets = { enabled = true } },

    menu = {
      -- nvim-cmp style menu
      draw = {
        padding = { 0, 1 }, -- padding only on right side
        components = {
          kind_icon = {
            text = function(ctx)
              return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
            end,
          },
        },
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" },
        },
      },
    },
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "copilot", "sql" },
    providers = {
      buffer = {
        opts = {
          -- get all buffers, even ones like neo-tree
          -- get_bufnrs = vim.api.nvim_list_bufs,
          -- or (recommended) filter to only "normal" buffers
          get_bufnrs = function()
            return vim.tbl_filter(function(bufnr)
              return vim.bo[bufnr].buftype == ""
            end, vim.api.nvim_list_bufs())
          end,
        },
      },
      -- cmdline = {
      --   min_keyword_length = function(ctx)
      --     -- when typing a command, only show when the keyword is 3 characters or longer
      --     if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
      --       return 3
      --     end
      --     return 0
      --   end,
      -- },
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
        opts = {
          kind_icon = "", ---@type string | false
        },
      },
      sql = {
        -- IMPORTANT: use the same name as you would for nvim-cmp
        name = "sql",
        module = "blink.compat.source",

        -- all blink.cmp source config options work as normal:
        score_offset = -3,

        -- this table is passed directly to the proxied completion source
        -- as the `option` field in nvim-cmp's source config
        --
        -- this is NOT the same as the opts in a plugin's lazy.nvim spec
        opts = {},
        should_show_items = function()
          return vim.tbl_contains(
            -- Enable completion only for sql file
            -- By default, enabled for all file-types.
            { "sql" },
            vim.o.filetype
          )
        end,
      },
    },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = "prefer_rust_with_warning" },

  signature = { enabled = true },

  cmdline = {
    keymap = {
      preset = "cmdline",

      ["<Tab>"] = { "show_and_insert", "select_next" },
      ["<S-Tab>"] = { "show_and_insert", "select_prev" },

      ["<C-space>"] = { "show", "fallback" },

      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Right>"] = { "select_next", "fallback" },
      ["<Left>"] = { "select_prev", "fallback" },

      ["<C-y>"] = { "select_and_accept" },
      ["<C-e>"] = { "cancel" },
    },
    completion = { menu = { auto_show = true } },
  },
}
