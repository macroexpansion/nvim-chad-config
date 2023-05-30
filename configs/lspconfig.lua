local on_attach = require 'plugins.configs.lspconfig'.on_attach
local capabilities = require 'plugins.configs.lspconfig'.capabilities

local lspconfig = require 'lspconfig'

lspconfig.rust_analyzer.setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local utils = require 'core.utils'

        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        utils.load_mappings('lspconfig', { buffer = bufnr })

        if client.server_capabilities.signatureHelpProvider then
            require('nvchad_ui.signature').setup(client)
        end

        if not utils.load_config().ui.lsp_semantic_tokens then
            client.server_capabilities.semanticTokensProvider = nil
        end

        local format_sync_group = vim.api.nvim_create_augroup('Format', {})
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = { '*.rs' },
            callback = function()
                vim.lsp.buf.format { timeout_ms = 200, async = true }
            end,
            group = format_sync_group,
        })
    end,
    cmd = { '/home/nqduy13/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer' }
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            }
        }
    }
}