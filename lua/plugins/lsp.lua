local lsp_keymaps = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<S-F12>", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({ automatic_installation = true })
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        on_attach = lsp_keymaps,
                    })
                end,

                ["ansiblels"] = function()
                    require('lspconfig').ansiblels.setup({
                        filetypes = { "yaml.ansible", "yml", "yaml" }
                    })
                end,

                ["pylsp"] = function()
                    require('lspconfig').pylsp.setup({
                        settings = {
                            pylsp = { plugins = { ruff = { enabled = true, formatEnabled = true } } }
                        }
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = { diagnostics = { globals = { "vim" } } }
                        }
                    }
                end,
            })
        end
    },
}
