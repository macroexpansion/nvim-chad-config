require("nvim-treesitter.configs").setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["a="] = { query = "@assignment.outer", desc = "(ts) outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "(ts) inner part of an assignment" },
        -- ["l="] = { query = "@assignment.lhs", desc = "left hand side part of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "(ts) right hand side part of an assignment" },

        ["am"] = { query = "@block.outer", desc = "(ts) code block" },
        ["im"] = { query = "@block.inner", desc = "(ts) code block" },

        ["ai"] = { query = "@call.outer", desc = "(ts) function invocation" },
        ["ii"] = { query = "@call.inner", desc = "(ts) function invocation" },

        ["af"] = { query = "@function.outer", desc = "(ts) a function implementation" },
        ["if"] = { query = "@function.inner", desc = "(ts) a function implementation" },

        ["ac"] = { query = "@class.outer", desc = "(ts) a class region" },
        ["ic"] = { query = "@class.inner", desc = "(ts) a class region" },

        ["ar"] = { query = "@parameter.outer", desc = "(ts) a parameter" },
        ["ir"] = { query = "@parameter.inner", desc = "(ts) a parameter" },

        ["an"] = { query = "@statement.outer", desc = "(ts) a statement" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = { query = "@parameter.inner", desc = "(ts) Swap next parameter" },
      },
      swap_previous = {
        ["<leader>A"] = { query = "@parameter.inner", desc = "(ts) Swap previous parameter" },
      },
    },
  },
}
