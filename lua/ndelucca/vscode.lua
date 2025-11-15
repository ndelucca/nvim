-- VSCode-specific configuration
-- This file is loaded when vim.g.vscode is set (running inside VSCode with vscode-neovim extension)

local vscode = require('vscode')

local nmap = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { desc = desc })
end

local vmap = function(lhs, rhs, desc)
    vim.keymap.set('v', lhs, rhs, { desc = desc })
end

-- General
nmap('<F5>', function()
    vscode.action('workbench.action.files.revert')
end, 'Revert file')

-- File explorer
nmap('-', function()
    vscode.action('workbench.files.action.showActiveFileInExplorer')
end, 'Reveal in explorer')

-- LSP mappings
nmap('<leader>la', function()
    vscode.action('editor.action.quickFix')
end, 'Code actions')

nmap('<leader>ld', function()
    vscode.action('editor.action.showHover')
end, 'Show hover')

nmap('<leader>lf', function()
    vscode.action('editor.action.formatDocument')
end, 'Format document')

vmap('<leader>lf', function()
    vscode.action('editor.action.formatSelection')
end, 'Format selection')

nmap('<leader>li', function()
    vscode.action('editor.action.goToImplementation')
end, 'Go to implementation')

nmap('<leader>lh', function()
    vscode.action('editor.action.showHover')
end, 'Hover')

nmap('<leader>lr', function()
    vscode.action('editor.action.rename')
end, 'Rename symbol')

nmap('<leader>lR', function()
    vscode.action('references-view.findReferences')
end, 'Find references')

nmap('<leader>ls', function()
    vscode.action('editor.action.revealDefinition')
end, 'Go to definition')

nmap('<leader>lt', function()
    vscode.action('editor.action.goToTypeDefinition')
end, 'Go to type definition')

-- Pickers / Fuzzy finders mapped to VSCode equivalents
nmap('<leader>ff', function()
    vscode.action('workbench.action.quickOpen')
end, 'Quick open files')

nmap('<leader>f/', function()
    vscode.action('workbench.action.showCommands')
end, 'Command palette')

nmap('<leader>f:', function()
    vscode.action('workbench.action.showCommands')
end, 'Command palette')

nmap('<leader>fa', function()
    vscode.action('workbench.view.scm')
end, 'Source control view')

nmap('<leader>fA', function()
    vscode.action('workbench.view.scm')
end, 'Source control view')

nmap('<leader>fd', function()
    vscode.action('workbench.actions.view.problems')
end, 'Problems panel')

nmap('<leader>fg', function()
    vscode.action('workbench.action.findInFiles')
end, 'Search in files')

nmap('<leader>fG', function()
    vscode.action('workbench.action.findInFiles', {
        args = { query = vim.fn.expand('<cword>') }
    })
end, 'Search word under cursor')

nmap('<leader>fh', function()
    vscode.action('workbench.action.showCommands')
end, 'Command palette')

nmap('<leader>fb', function()
    vscode.action('workbench.action.showAllEditors')
end, 'Show all editors')

nmap('<leader>fB', function()
    vscode.action('workbench.action.showAllEditors')
end, 'Show all editors')

-- Buffer management
nmap('<leader>bj', function()
    vscode.action('workbench.action.previousEditor')
end, 'Previous editor')

nmap('<leader>bk', function()
    vscode.action('workbench.action.nextEditor')
end, 'Next editor')

nmap('<leader>ba', function()
    vscode.action('workbench.action.openPreviousRecentlyUsedEditor')
end, 'Alternate editor')

nmap('<leader>bd', function()
    vscode.action('workbench.action.closeActiveEditor')
end, 'Close editor')

nmap('<leader>bD', function()
    vscode.action('workbench.action.revertAndCloseActiveEditor')
end, 'Close editor (force)')

nmap('<leader>bw', function()
    vscode.action('workbench.action.closeActiveEditor')
end, 'Close editor')

nmap('<leader>bW', function()
    vscode.action('workbench.action.revertAndCloseActiveEditor')
end, 'Close editor (force)')

-- Terminal
nmap('tT', function()
    vscode.action('workbench.action.terminal.toggleTerminal')
end, 'Toggle terminal')

nmap('tt', function()
    vscode.action('workbench.action.terminal.toggleTerminal')
end, 'Toggle terminal')

-- Additional useful VSCode mappings
nmap('<leader>e', function()
    vscode.action('workbench.view.explorer')
end, 'Focus explorer')

nmap('<leader>gg', function()
    vscode.action('workbench.view.scm')
end, 'Source control')

nmap('<leader>xx', function()
    vscode.action('workbench.actions.view.problems')
end, 'Problems')

nmap('<leader>/', function()
    vscode.action('editor.action.commentLine')
end, 'Toggle comment')

vmap('<leader>/', function()
    vscode.action('editor.action.commentLine')
end, 'Toggle comment')

-- Focus management
nmap('<leader>we', function()
    vscode.action('workbench.action.focusActiveEditorGroup')
end, 'Focus editor')

nmap('<C-w>w', function()
    vscode.action('workbench.action.focusActiveEditorGroup')
end, 'Focus editor')

nmap('<leader>wc', function()
    vscode.action('workbench.action.closeSidebar')
end, 'Close sidebar')
