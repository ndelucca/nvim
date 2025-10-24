return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.cursorword').setup({})
            require('mini.move').setup({})
            require('mini.splitjoin').setup({})
            require('mini.files').setup({ options = { use_as_default_command = true, } })
            require('mini.icons').setup({})
            require('mini.completion').setup({})
            require('mini.pick').setup({})
            require('mini.extra').setup({})
            require('mini.statusline').setup({})
        end
    }
}
