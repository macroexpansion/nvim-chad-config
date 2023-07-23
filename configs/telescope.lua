local actions = require 'telescope.actions'

local M = {
    defaults = {
        mappings = {
            n = {
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-h>"] = actions.preview_scrolling_left,
                ["<C-l>"] = actions.preview_scrolling_right,
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
