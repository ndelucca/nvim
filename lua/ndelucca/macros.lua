local function interactive_replace()
    vim.cmd('normal! "xy')
    local selected_text = vim.fn.getreg('x')
    local replacement_text = vim.fn.input("Replacement: ")
    vim.cmd("execute ':%s/" .. selected_text .. "/" .. replacement_text .. "/gc'")
end

local function interactive_search_replace()
    local selected_text = vim.fn.input("Search: ")
    local replacement_text = vim.fn.input("Replacement: ")
    vim.cmd("execute ':%s/" .. selected_text .. "/" .. replacement_text .. "/gc'")
end

vim.keymap.set('v', '<leader>fd', function() interactive_replace() end, { noremap = true, silent = false })
vim.keymap.set('n', '<leader>ff', function() interactive_search_replace() end, { noremap = true, silent = false })

vim.api.nvim_create_user_command(
    'ToggleSplitStruct',
    function()
        require('mini.splitjoin').toggle()
    end,
    { desc = "Splits or folds a multi-value data structure." }
)
