return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.comment').setup({
                mappings = {
                    comment = '',
                    comment_line = '<leader>cl',
                    comment_visual = '<leader>cl',
                    textobject = '',
                },
            })
        end
    }
}
