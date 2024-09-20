require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "pylsp",
        -- "ruff_lsp",
        "perlnavigator",
        "lua_ls",
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
                                enabled = true,                        -- Enable the plugin
                                formatEnabled = true,                  -- Enable formatting using ruffs formatter
                                extendSelect = { "I" },                -- Rules that are additionally used by ruff
                                extendIgnore = { "C90" },              -- Rules that are additionally ignored by ruff
                                -- format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                                severities = { ["D212"] = "I" },       -- Optional table of rules where a custom severity is desired
                                unsafeFixes = false,                   -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
                                -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                                lineLength = 100,                      -- Line length to pass to ruff checking and formatting
                                exclude = { "__about__.py" },          -- Files to be excluded by ruff checking
                                select = { "F" },                      -- Rules to be enabled by ruff
                                ignore = { "D210" },                   -- Rules to be ignored by ruff
                                perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
                                preview = false,                       -- Whether to enable the preview style linting and formatting.
                                targetVersion = "py39",                -- The minimum python version to target (applies for both linting and formatting).
                            },
                        }
                    }
                }
            })
        end,

        -- ruff_lsp = function()
        --     require('lspconfig').ruff_lsp.setup({})
        -- end,

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
