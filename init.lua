vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode == nil then
    require 'ndelucca.lazyinit'
end

require 'ndelucca.set'

if vim.g.vscode then
    require 'ndelucca.vscode'
else
    require 'ndelucca.mappings'
end
