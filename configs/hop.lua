local status, hop = pcall(require, "hop")
if not status then
  return
end

hop.setup()

vim.keymap.set("n", "<leader>j", function()
  hop.hint_words()
end, { remap = true })

-- local directions = require('hop.hint').HintDirection
