return {
    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     name = "oxocarbon",
    --     config = function()
    --         vim.cmd("colorscheme oxocarbon")
    --     end
    -- },
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        config = function()
            vim.cmd("colorscheme dracula")
        end
    },
    -- {
    --     "projekt0n/github-nvim-theme",
    --     name = "github-theme",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("github-theme").setup({})
    --     end,
    --     init = function()
    --         vim.cmd("colorscheme github_dark_default")
    --     end,
    -- },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        },
    }
}
