vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "<C-u>","<C-u>zz",{noremap = true})
vim.keymap.set("n", "<C-d>","<C-d>zz",{noremap = true})
vim.keymap.set({'n','v'}, '<leader>I', function() vim.lsp.buf.format({async = true})end, {noremap = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>ph', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

