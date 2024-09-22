if vim.g.vscode then
    require 'ndelucca.mappings'
    require 'ndelucca.set'
    require 'ndelucca.macros'
    return
end

require 'ndelucca.lazyinit'
require 'ndelucca.lsp'
require 'ndelucca.set'
require 'ndelucca.extras'
require 'ndelucca.mappings'
require 'ndelucca.macros'
