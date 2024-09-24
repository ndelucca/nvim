vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if not vim.g.vscode then
    require 'ndelucca.lazyinit'
end

require 'ndelucca.set'
require 'ndelucca.mappings'
require 'ndelucca.macros'
