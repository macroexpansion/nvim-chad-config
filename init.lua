local opt = vim.opt

opt.clipboard = ""

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.scrolloff = 7
opt.wrap = false
opt.updatetime = 100
opt.relativenumber = true
opt.nu = true
opt.hlsearch = true
opt.incsearch = true

vim.api.nvim_create_autocmd('TermEnter', {
    callback = function ()
        -- vim.cmd("<Esc>")
    end
})
