if vim.g.vscode then
    require 'ndelucca.mappings'
    require 'ndelucca.set'
    require 'ndelucca.macros'
    return
end

require 'ndelucca.set'
require 'ndelucca.lazyinit'
require 'ndelucca.lsp'
require 'ndelucca.treesitter'
require 'ndelucca.git'
require 'ndelucca.mini'
require 'ndelucca.mappings'
require 'ndelucca.macros'
