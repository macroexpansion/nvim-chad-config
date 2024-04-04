local actions = require "telescope.actions"

local M = {
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        ["<A-j>"] = actions.cycle_history_next,
        ["<A-k>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-h>"] = actions.preview_scrolling_left,
        ["<C-l>"] = actions.preview_scrolling_right,
        ["o"] = actions.select_default,
      },
      i = {
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-h>"] = actions.preview_scrolling_left,
        ["<C-l>"] = actions.preview_scrolling_right,
      },
    },
    layout_config = {
      horizontal = {
        preview_width = 0.5,
        results_width = 0.5,
      },
      width = 0.95,
      height = 0.93,
      preview_cutoff = 120,
    },
  },
}

return M
