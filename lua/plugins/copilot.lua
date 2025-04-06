return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            markdown = true,
            help = false,
            gitcommit = true,
            ["*"] = true,
        }
    end,
}
