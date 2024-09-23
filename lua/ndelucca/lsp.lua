require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "pylsp",
        "eslint",
        "perlnavigator",
        "lua_ls",
        "gopls",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        ansiblels = function()
            require('lspconfig').ansiblels.setup({
                filetypes = {
                    "yaml.ansible",
                    "yml",
                    "yaml",
                }
            })
        end,

        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            autopep8 = {
                                enable = false,
                            },
                            ruff = {
                                enabled = true,                                  -- Enable the plugin
                                formatEnabled = true,                            -- Enable formatting using ruffs formatter
                                extendSelect = { "I" },                          -- Rules that are additionally used by ruff
                                extendIgnore = { "C90" },                        -- Rules that are additionally ignored by ruff
                                -- format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                                severities = { ["D212"] = "I" },                 -- Optional table of rules where a custom severity is desired
                                unsafeFixes = false,                             -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
                                -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                                lineLength = 100,                                -- Line length to pass to ruff checking and formatting
                                exclude = { "__about__.py" },                    -- Files to be excluded by ruff checking
                                select = { "F" },                                -- Rules to be enabled by ruff
                                ignore = { "D210" },                             -- Rules to be ignored by ruff
                                perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
                                preview = false,                                 -- Whether to enable the preview style linting and formatting.
                                targetVersion = "py311",                          -- The minimum python version to target (applies for both linting and formatting).
                            },
                        }
                    }
                }
            })
        end,

        gopls = function()
            require('lspconfig').gopls.setup {}
        end,

        eslint = function()
            require('lspconfig').eslint.setup({})
        end,

        perlnavigator = function()
            require('lspconfig').perlnavigator.setup({})
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME }
                        },
                    })
                end,
                settings = {
                    Lua = {}
                }
            })
        end
    }
})

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<S-F12>", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Symbol References" })
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to Next Diagnostic" })
    -- vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to Previous Diagnostic" })
    -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic to local list" })
end

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
        }
    end,
}
