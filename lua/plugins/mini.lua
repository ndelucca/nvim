return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            -- Plugins that work in both VSCode and standalone Neovim
            require('mini.move').setup({})
            require('mini.splitjoin').setup({})

            -- Plugins only for standalone Neovim
            if not vim.g.vscode then
                require('mini.cursorword').setup({})
                require('mini.files').setup({ options = { use_as_default_command = true, } })
                require('mini.icons').setup({})
                require('mini.bufremove').setup({})
                require('mini.completion').setup({})
                require('mini.pick').setup({
                    window = {
                        config = function()
                            local width = math.floor(vim.o.columns * 0.9)
                            local height = math.floor(vim.o.lines * 0.8)
                            return {
                                anchor = 'NW',
                                border = 'rounded',
                                style = 'minimal',
                                relative = 'editor',
                                row = math.floor((vim.o.lines - height) / 2),
                                col = math.floor((vim.o.columns - width) / 2),
                                width = width,
                                height = height,
                            }
                        end,
                    },
                    sources = {
                        files = {
                            hidden = true,
                        },
                    },
                })
                require('mini.extra').setup({})
                require('mini.statusline').setup({})
            end
        end
    }
}
