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
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "awk_ls",
                    "bashls",
                    "cssls",
                    "dockerls",
                    "gopls",
                    "grammarly",
                    "html",
                    "jsonls",
                    "lua_ls",
                    "marksman",
                    "pyright",
                    "harper_ls",
                    "sqls",
                    "yamlls"
                },
                automatic_installation = true
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        on_attach = lsp_keymaps,
                    })
                end,

                ["ansiblels"] = function()
                    require('lspconfig').ansiblels.setup({
                        on_attach = lsp_keymaps,
                        filetypes = { "yaml.ansible", "yml", "yaml" }
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        on_attach = lsp_keymaps,
                        settings = {
                            Lua = { diagnostics = { globals = { "vim" } } }
                        }
                    }
                end,
            })
        end
    },
}
