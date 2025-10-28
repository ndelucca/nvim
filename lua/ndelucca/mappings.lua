local nmap = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { desc = desc })
end

-- General
nmap('<F5>', ':checktime<CR>')
-- File explorer
nmap("-", '<Cmd>lua MiniFiles.open()<CR>', "File explorer")
-- LSP
nmap('<leader>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Actions')
nmap('<leader>ld', '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic popup')
nmap('<leader>lf', '<Cmd>lua require("conform").format({lsp_fallback=true})<CR>', 'Format')
nmap('<leader>li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
nmap('<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nmap('<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
nmap('<leader>lR', '<Cmd>lua vim.lsp.buf.references()<CR>', 'References')
nmap('<leader>ls', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Source definition')
nmap('<leader>lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')
-- Pickers
nmap('<leader>f/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap('<leader>f:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap('<leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>', 'Added hunks (all)')
nmap('<leader>fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', 'Added hunks (buf)')
nmap('<leader>fd', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap('<leader>fF', '<Cmd>Pick git_files<CR>', 'Git Files')
nmap('<leader>ff', '<Cmd>Pick files<CR>', 'Files')
nmap('<leader>fg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap('<leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap('<leader>fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap('<leader>fb', '<Cmd>lua require("buffer_manager.ui").toggle_quick_menu()<CR>', 'Buffers')
nmap('<leader>fB', '<Cmd>Pick buffers<CR>', 'Buffers')

-- Buffer management
nmap('<leader>bj', '<Cmd>bprev<CR>', 'Previous buffer')
nmap('<leader>bk', '<Cmd>bnext<CR>', 'Next buffer')
nmap('<leader>ba', '<Cmd>b#<CR>', 'Alternate')
nmap('<leader>bd', '<Cmd>lua MiniBufremove.delete()<CR>', 'Delete')
nmap('<leader>bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>', 'Delete!')
nmap('<leader>bw', '<Cmd>lua MiniBufremove.wipeout()<CR>', 'Wipeout')
nmap('<leader>bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'Wipeout!')
-- Terminal
vim.keymap.set('t', '<F4>', [[<C-\><C-n>]], { noremap = true, silent = true })
nmap('tT', '<Cmd>horizontal term<CR>', 'Terminal (horizontal)')
nmap('tt', '<Cmd>vertical term<CR>', 'Terminal (vertical)')
-- Custom
vim.api.nvim_create_user_command(
    'ToggleSplitStruct',
    function()
        require('mini.splitjoin').toggle()
    end,
    { desc = "Splits or folds a multi-value data structure." }
)
