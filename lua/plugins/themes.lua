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
}
