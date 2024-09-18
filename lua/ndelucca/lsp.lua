require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "ruff_lsp",
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

        ruff_lsp = function()
            require('lspconfig').ruff_lsp.setup({})
        end,

        perlnavigator = function()
            require('lspconfig').perlnavigator.setup({})
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
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

