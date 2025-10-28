return {
    {
        'j-morano/buffer_manager.nvim',
        config = function()
            require("buffer_manager").setup({
                width                     = 0.8,
                select_menu_item_commands = {
                    v = {
                        key = "<C-v>",
                        command = "vsplit"
                    },
                },
            })
        end
    },
}
