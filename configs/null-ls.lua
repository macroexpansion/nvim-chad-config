local null_ls = require 'null-ls'

local opts = {
    sources = {
        -- null_ls.builtins.formatting.rustfmt
         null_ls.builtins.formatting.gofmt
    }
}

return opts
