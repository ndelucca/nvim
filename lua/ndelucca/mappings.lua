vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })

vim.keymap.set('n', '<C-h>', ':bprev<CR>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true })

vim.keymap.set('n', '<C-j>', ':cprev<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':cnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>co', ':copen<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { noremap = true })

vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>", { desc = "File explorer" })

vim.keymap.set('n', '<C-p>', function()
    local ok = pcall(MiniExtra.pickers.git_files, {}, {})
    if not ok then
        MiniPick.builtin.files({}, {})
    end
end, { desc = 'Git files or all files' })

vim.keymap.set('n', '<leader>ff', function() MiniPick.builtin.files({}, {}) end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>b', function() MiniPick.builtin.buffers({}, {}) end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fs', function() MiniPick.builtin.grep_live({}, {}) end, { desc = 'Live grep' })

vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<CR>', { desc = 'Blame line' })
vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })

vim.keymap.set({ "n", "x" }, "<leader>z", ":ZenMode<CR>", { desc = "Toggle zen mode" })

vim.api.nvim_create_user_command(
    'ToggleSplitStruct',
    function()
        require('mini.splitjoin').toggle()
    end,
    { desc = "Splits or folds a multi-value data structure." }
)
