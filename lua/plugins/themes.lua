return {
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        cond = not vim.g.vscode,
        config = function()
            vim.cmd("colorscheme dracula")
        end
    },
}
