require("nvim-treesitter.configs").setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["a="] = { query = "@assignment.outer", desc = "outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "inner part of an assignment" },
        -- ["l="] = { query = "@assignment.lhs", desc = "left hand side part of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "right hand side part of an assignment" },

        ["am"] = { query = "@block.outer", desc = "a code block" },
        ["im"] = { query = "@block.inner", desc = "a code block" },

        ["ai"] = { query = "@call.outer", desc = "a function invocation" },
        ["ii"] = { query = "@call.inner", desc = "a function invocation" },

        ["af"] = { query = "@function.outer", desc = "a function implementation" },
        ["if"] = { query = "@function.inner", desc = "a function implementation" },

        ["ac"] = { query = "@class.outer", desc = "a class region" },
        ["ic"] = { query = "@class.inner", desc = "a class region" },

        ["ar"] = { query = "@parameter.outer", desc = "a parameter" },
        ["ir"] = { query = "@parameter.inner", desc = "a parameter" },

        ["an"] = { query = "@statement.outer", desc = "a statement" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = { query = "@parameter.inner", desc = "Swap next parameter" },
      },
      swap_previous = {
        ["<leader>A"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
      },
    },
  },
}
