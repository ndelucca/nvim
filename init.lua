vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode == nil then
    require 'ndelucca.lazyinit'
end

require 'ndelucca.set'
require 'ndelucca.mappings'
