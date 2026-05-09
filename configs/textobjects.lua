require("nvim-treesitter-textobjects").setup {
  select = {
    enable = true,
    lookahead = true,
    -- keymaps = {
    --   ["a="] = { query = "@assignment.outer", desc = "(ts) outer part of an assignment" },
    --   ["i="] = { query = "@assignment.inner", desc = "(ts) inner part of an assignment" },
    --   -- ["l="] = { query = "@assignment.lhs", desc = "left hand side part of an assignment" },
    --   ["r="] = { query = "@assignment.rhs", desc = "(ts) right hand side part of an assignment" },
    --
    --   ["am"] = { query = "@block.outer", desc = "(ts) code block" },
    --   ["im"] = { query = "@block.inner", desc = "(ts) code block" },
    --
    --   ["ai"] = { query = "@call.outer", desc = "(ts) function invocation" },
    --   ["ii"] = { query = "@call.inner", desc = "(ts) function invocation" },
    --
    --   ["af"] = { query = "@function.outer", desc = "(ts) a function implementation" },
    --   ["if"] = { query = "@function.inner", desc = "(ts) a function implementation" },
    --
    --   ["ac"] = { query = "@class.outer", desc = "(ts) a class region" },
    --   ["ic"] = { query = "@class.inner", desc = "(ts) a class region" },
    --
    --   ["ar"] = { query = "@parameter.outer", desc = "(ts) a parameter" },
    --   ["ir"] = { query = "@parameter.inner", desc = "(ts) a parameter" },
    --
    --   ["an"] = { query = "@statement.outer", desc = "(ts) a statement" },
    -- },
  },
  -- swap = {
  --   enable = true,
  --   swap_next = {
  --     ["<leader>a"] = { query = "@parameter.inner", desc = "(ts) Swap next parameter" },
  --   },
  --   swap_previous = {
  --     ["<leader>A"] = { query = "@parameter.inner", desc = "(ts) Swap previous parameter" },
  --   },
  -- },
}

local textobjects = {
  ["a="] = "@assignment.outer",
  ["i="] = "@assignment.inner",
  ["r="] = "@assignment.rhs",
  ["am"] = "@block.outer",
  ["im"] = "@block.inner",
  ["ai"] = "@call.outer",
  ["ii"] = "@call.inner",
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
  ["ar"] = "@parameter.outer",
  ["ir"] = "@parameter.inner",
  ["an"] = "@statement.outer",
}
for key, query in pairs(textobjects) do
  vim.keymap.set({ "x", "o" }, key, function()
    require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
  end)
end

-- vim.keymap.set("n", "<leader>a", function()
--   require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
-- end)
-- vim.keymap.set("n", "<leader>A", function()
--   require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
-- end)
