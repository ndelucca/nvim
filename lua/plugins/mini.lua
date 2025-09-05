return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()

            vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>")

            require('mini.cursorword').setup({})
            require('mini.move').setup({})
            require('mini.pairs').setup({})
            require('mini.files').setup({
                options = {
                    use_as_default_command = true,
                }
            })
            require('mini.icons').setup({})
        end
    }
}
