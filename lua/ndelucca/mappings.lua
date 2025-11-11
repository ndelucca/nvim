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
nmap('<leader>lf', '<Cmd>lua require("conform").format({timeout_ms=3000, lsp_fallback=true})<CR>', 'Format')
nmap('<leader>li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
nmap('<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nmap('<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
nmap('<leader>lR', '<Cmd>lua vim.lsp.buf.references()<CR>', 'References')
nmap('<leader>ls', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Source definition')
nmap('<leader>lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')
-- Pickers
local pick = require('mini.pick')
local buffer_ui = require('buffer_manager.ui')
local builtin = pick.builtin
local function in_git_repo()
    local result = vim.system({ 'git', 'rev-parse', '--is-inside-work-tree' }):wait()
    return result.code == 0
end
local function smart_files()
    if in_git_repo() then
        -- inside git repo: tracked + unstaged
        builtin.cli({
            command = { 'bash', '-c', 'git ls-files && git ls-files --others --exclude-standard' },
            prompt = 'Git files',
        })
    else
        -- not a git repo: normal file picker
        builtin.files({ show_hidden = true })
    end
end
nmap('<leader>ff', smart_files, 'Smart files')
nmap('<leader>f/', function() builtin.history({ scope = '/' }) end, '"/" history')
nmap('<leader>f:', function() builtin.history({ scope = ':' }) end, '":" history')
nmap('<leader>fa', function() builtin.git_hunks({ scope = 'staged' }) end, 'Added hunks (all)')
nmap('<leader>fA', function() builtin.git_hunks({ path = '%', scope = 'staged' }) end, 'Added hunks (buf)')
nmap('<leader>fd', function() builtin.diagnostic({ scope = 'current' }) end, 'Diagnostic buffer')
nmap('<leader>fg', function() builtin.grep_live({ show_hidden = true }) end, 'Live grep')
nmap('<leader>fG', function() builtin.grep({ show_hidden = true, pattern = vim.fn.expand('<cword>'), }) end,
    'Grep current word')
nmap('<leader>fh', function() builtin.help() end, 'Help tags')
nmap('<leader>fb', function() buffer_ui.toggle_quick_menu() end, 'Buffer manager')
nmap('<leader>fB', function() builtin.buffers() end, 'Buffers')
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
