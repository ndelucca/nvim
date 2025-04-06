local lsp_keymaps = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>I", vim.lsp.buf.format, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            local servers = {
                "awk_ls", "bashls", "cssls", "dockerls", "gopls", "grammarly", "html",
                "jsonls", "lua_ls", "marksman", "pyright", "sqls", "yamlls"
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({ on_attach = lsp_keymaps })
            end

            lspconfig.lua_ls.setup {
                on_attach = lsp_keymaps,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }

            lspconfig.pyright.setup {
                on_attach = lsp_keymaps,
                settings = {
                    pyright = { disableOrganizeImports = true },
                    python = {
                        analysis = { ignore = { "*" } }
                    }
                }
            }

            if lspconfig.ruff then
                lspconfig.ruff.setup {
                    on_attach = lsp_keymaps,
                    settings = {
                        configurationPreference = "filesystemFirst",
                        organizeImports = true
                    }
                }
            end

            lspconfig.perlnavigator.setup {
                on_attach = lsp_keymaps,
                cmd = { "perlnavigator" },
                settings = {
                    perlnavigator = {
                        perlPath = "perl",
                        enableWarnings = true,
                        perlcriticEnabled = true,
                        includePaths = {
                            "./", "./aula/", "./aula/libs/", "./lib/perl/", "./build/lib/"
                        },
                        perlParams = {
                            "-I", "/var/www/educativa/campus-dev/aula/",
                            "-I", "/var/www/educativa/campus-dev/aula/libs/",
                            "-I", "/var/www/educativa/campus-dev/lib/perl/",
                            "-I", "/var/www/educativa/campus-dev/build/lib/"
                        }
                    }
                }
            }
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    }
}
