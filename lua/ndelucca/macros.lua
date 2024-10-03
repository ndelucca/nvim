vim.api.nvim_create_user_command(
    'ToggleSplitStruct',
    function()
        require('mini.splitjoin').toggle()
    end,
    { desc = "Splits or folds a multi-value data structure." }
)
