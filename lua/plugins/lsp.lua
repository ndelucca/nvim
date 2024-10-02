local lsp_keymaps = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<S-F12>", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>I", vim.lsp.buf.format, { noremap = true })

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
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
                    "awk_ls", "bashls", "cssls", "dockerls", "gopls", "grammarly", "html",
                    "jsonls", "lua_ls", "marksman", "pyright", "sqls", "yamlls"
                },
                automatic_installation = true
            })
            require("mason-lspconfig").setup_handlers({

                function(server_name)
                    require('lspconfig')[server_name].setup({ on_attach = lsp_keymaps, })
                end,

                ["ansiblels"] = function()
                    require('lspconfig').ansiblels.setup({
                        filetypes = {
                            "yaml.ansible", "yml", "yaml"
                        }
                    })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup { on_attach = lsp_keymaps, settings = {
                        Lua = { diagnostics = { globals = { "vim" } } }
                    } }
                end,

                ["pyright"] = function()
                    require("lspconfig").pyright.setup({
                        on_attach = lsp_keymaps,
                        settings = {
                            pyright = { disableOrganizeImports = true, },
                            python = { analysis = { ignore = { '*' }, }, },
                        }
                    })
                end,

                ["ruff"] = function()
                    require("lspconfig").ruff.setup({
                        on_attach = lsp_keymaps,
                        settings = {
                            configurationPreference = "filesystemFirst", organizeImports = true,
                        }
                    })
                end,

            })
        end
    },
}
