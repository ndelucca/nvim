return {
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end,
        init = function()
            vim.cmd("colorscheme poimandres")
        end
    -- },
    -- {
    --     'rebelot/kanagawa.nvim',
    --     config = function()
    --         vim.cmd.colorscheme("kanagawa-dragon")
    --     end
    },
}
