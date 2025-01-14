return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.cursorword').setup({})
            require('mini.move').setup({})
            require('mini.pairs').setup({})
            require('mini.icons').setup({})
            require('mini.tabline').setup({})
            require('mini.statusline').setup({})
            require('mini.surround').setup({
                highlight_duration = 500,
                mappings = {
                    add = '<leader>sa',
                    delete = '<leader>sd',
                    find = '<leader>sf',
                    find_left = '<leader>sF',
                    replace = '<leader>sr',
                    highlight = '',
                    update_n_lines = '',
                    suffix_last = '',
                    suffix_next = '',
                },
            })
        end
    }
}
