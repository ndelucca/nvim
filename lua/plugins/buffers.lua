return {
    {
        'j-morano/buffer_manager.nvim',
        config = function()
            require("buffer_manager").setup({
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
