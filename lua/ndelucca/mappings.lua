-- vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })

-- vim.keymap.set('n', '<leader>ww', ':bd<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>wq', ':bd!<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>qw', ':bufdo bd<CR>', { noremap = true })

vim.keymap.set('n', '<C-j>', ':bprev<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':bnext<CR>', { noremap = true })

-- Replace text ocurrences
vim.keymap.set("n", '<leader>rt', '*:%s///g<left><left>', { noremap = true })
vim.keymap.set("v", '<leader>rt', '"hy:%s/<C-r>h//g<left><left>', { noremap = true })
-- Confirm replace text one by one
vim.keymap.set("n", '<leader>rc', '*:%s///gc<left><left><left>', { noremap = true })
