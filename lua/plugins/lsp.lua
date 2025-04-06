local lsp_keymaps = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

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
    vim.keymap.set('n', '<leader>I', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end
return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        version = "v1.10.0",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true
            })
            require("mason-lspconfig").setup_handlers({

                function(server_name)
                    require('lspconfig')[server_name].setup({ on_attach = lsp_keymaps, })
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

                ["perlnavigator"] = require('lspconfig').perlnavigator.setup({
                    cmd = { "perlnavigator" },
                    settings = {
                        perlnavigator = {
                            perlPath = 'perl',
                            enableWarnings = true,
                            perlcriticEnabled = true,
                            includePaths = {
                                "./",
                                "./aula/",
                                "./aula/libs/",
                                "./lib/perl/",
                                "./build/lib/",
                            },
                            perlParams = {
                                "-I", "/var/www/educativa/campus-dev/aula/",
                                "-I", "/var/www/educativa/campus-dev/aula/libs/",
                                "-I", "/var/www/educativa/campus-dev/lib/perl/",
                                "-I", "/var/www/educativa/campus-dev/build/lib/",
                            },
                        }
                    }
                })
            })
        end
    },
}
