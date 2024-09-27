local pyright = {}

function pyright.load(lsp_keymaps)
    return function()
        require("lspconfig").pyright.setup({
            on_attach = lsp_keymaps,
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { '*' },
                    },
                },
            }
        })
    end
end

local ruff = {}

function ruff.load(lsp_keymaps)
    return function()
        require("lspconfig").ruff.setup({
            on_attach = lsp_keymaps,
            settings = {
            }
        })
    end
end
