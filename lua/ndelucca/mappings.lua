vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set('n', '<leader>ww', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<leader>fww', ':bd!<CR>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>I', function() vim.lsp.buf.format({ async = true }) end, { noremap = true })

