return {
    {
        'rebelot/kanagawa.nvim',
        config = function()
            vim.cmd.colorscheme("kanagawa-dragon")
            -- vim.cmd.colorscheme("kanagawa-wave")
            -- vim.cmd.colorscheme("kanagawa-lotus")
        end
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'warmer',
                transparent = true,
            }
            require('onedark').load()
        end
    },
}
