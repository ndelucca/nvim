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

vim.keymap.set('v', '<leader><C-d>', function() interactive_replace() end, { noremap = true, silent = false })
vim.keymap.set('n', '<leader><C-f>', function() interactive_search_replace() end, { noremap = true, silent = false })
