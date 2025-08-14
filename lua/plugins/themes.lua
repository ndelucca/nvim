return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
        end,
        init = function()
            vim.cmd("colorscheme github_dark_default")
        end,
    },
    {
        "sschleemilch/slimline.nvim",
        opts = {},
        config = function()
            require("slimline").setup({
                style = 'fg',
            })
        end
    },
    {
        "folke/zen-mode.nvim",
        opts = {},
        config = function()
            require("zen-mode").setup({
                plugins = {
                    options = {
                        enabled = false,
                        laststatus = 0,
                        showtabline = 0,
                    },
                },
            })
            vim.keymap.set({"n", "x"}, "<leader>z", ":ZenMode<CR>")
        end
    }
}
