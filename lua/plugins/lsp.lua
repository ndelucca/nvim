return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.lsp.config('lua_ls', {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                '${3rd}/luv/library',
                                '${3rd}/busted/library',
                                vim.api.nvim_get_runtime_file('', true),
                            }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })

            vim.lsp.config('ansiblels', {
                on_attach = function(client, _)
                    client.server_capabilities.semanticTokensProvider = nil
                end
            })

            vim.lsp.config('ty', {
                root_dir = function(fname)
                    local util = require('lspconfig.util')
                    return util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git')(fname)
                end,
                before_init = function(_, config)
                    local root_dir = config.root_dir or vim.fn.getcwd()
                    local extra_paths = {}

                    -- Common project library directories
                    local common_lib_dirs = { 'lib', 'libs', 'vendor', 'src' }

                    for _, dir in ipairs(common_lib_dirs) do
                        local path = root_dir .. '/' .. dir
                        if vim.fn.isdirectory(path) == 1 then
                            table.insert(extra_paths, path)
                        end
                    end

                    -- Add project root itself
                    table.insert(extra_paths, root_dir)

                    config.settings.ty.python.analysis.extraPaths = extra_paths
                end,
                settings = {
                    ty = {
                        pythonPath = vim.fn.exepath('python3'),
                        experimental = {
                            rename = true,
                            autoImport = true,
                        },
                        python = {
                            analysis = {
                                extraPaths = {},
                                -- Add additional custom paths here:
                                -- extraPaths = { '/path/to/custom/libs' },
                            },
                        },
                    },
                },
            })

            local language_servers = {
                'ty',
                'ruff',
                'html',
                'perlnavigator',
                'lua_ls',
                'ansiblels',
            }

            for _, ls_name in ipairs(language_servers) do
                vim.lsp.enable(ls_name)
            end
        end
    },
    {
        'pearofducks/ansible-vim', -- Install Ansible syntax
        lazy = false,              -- Force load
        config = function()
            -- Set .yml and .yaml to yaml.ansible
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

            -- Disable auto unindent
            vim.g.ansible_unindent_after_newline = 0

            -- Set dim and more colors
            vim.g.ansible_name_highlight = 'ob'
            vim.g.ansible_extra_keywords_highlight = 1
            vim.g.ansible_attribute_highlight = 'b'

            -- Disable yaml highlight for treesitter if exists
            local treesitter_exists, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
            if treesitter_exists then
                treesitter_configs.setup {
                    highlight = { disable = { 'yaml' }, },
                }
            end
        end,
        ft = 'yaml.ansible',
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require 'mason'.setup {}
        end
    },
}
