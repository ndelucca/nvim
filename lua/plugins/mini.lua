return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.completion').setup({})
            require('mini.cursorword').setup({})
            require('mini.move').setup({})
            require('mini.pairs').setup({})
            require('mini.icons').setup({})
            require('mini.tabline').setup({})
            require('mini.statusline').setup({})
            require('mini.sessions').setup({})
            require('mini.files').setup({
                windows = {
                    preview = true,
                    width_focus = 50,
                    width_nofocus = 25,
                    width_preview = 70,
                },
            })
            require('mini.comment').setup({
                mappings = {
                    comment = '',
                    comment_line = '<leader>cl',
                    comment_visual = '<leader>cl',
                    textobject = '',
                },
            })
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
