-- vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>", { noremap = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set('n', '<leader>ww', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<leader>fww', ':bd!<CR>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>I', function() vim.lsp.buf.format({ async = true }) end, { noremap = true })

vim.keymap.set('n', '<C-j>', ':bprev<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>qw', ':bufdo bd<CR>', { noremap = true })
