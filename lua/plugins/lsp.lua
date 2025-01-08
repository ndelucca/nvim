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

local create_autocmd = vim.api.nvim_create_autocmd
local ansible_autogroup = vim.api.nvim_create_augroup('ansible_autogroup', {})

create_autocmd('BufEnter', {
    pattern = { '*.yml', '*.yaml' },
    command = 'setl ft=yaml.ansible',
    group = ansible_autogroup
})

create_autocmd('FileType', {
    pattern = 'yaml.ansible',
    command = 'setl tabstop=2 shiftwidth=2 softtabstop=2',
    group = ansible_autogroup
})

return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        'pearofducks/ansible-vim', -- Install Ansible syntax
        lazy = false,              -- Force load
        config = function()
            -- Disable auto unindent
            vim.g.ansible_unindent_after_newline = 0

            -- Set dim and more colors
            vim.g.ansible_name_highlight = 'd'
            vim.g.ansible_extra_keywords_highlight = 1
            vim.g.ansible_attribute_highlight = 'a'

            --- Disable highlight for ansiblels if exists
            local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
            if lspconfig_status and lspconfig.ansiblels then
                lspconfig.ansiblels.setup {
                    on_attach = function(client, buffern)
                        client.server_capabilities.semanticTokensProvider = nil
                    end
                }
            end

            --- Disable yaml highlight for treesitter if exists
            local treesitter_status, treesitter = pcall(require, 'nvim-treesitter.configs')
            if treesitter_status then
                require 'nvim-treesitter.configs'.setup {
                    highlight = { disable = { 'yaml' }, },
                }
            end
        end,
        ft = 'yaml.ansible',
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
                            -- perltidyProfile = '',
                            -- perlcriticProfile = '',
                            perlcriticEnabled = true,
                        }
                    }
                })
            })
        end
    },
}
