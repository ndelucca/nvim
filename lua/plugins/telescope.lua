return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                vimgrep_arguments = {
                    "rg", "--no-heading", "--with-filename",
                    "--line-number", "--column", "--smart-case", "--no-binary",
                    "--hidden"
                },
            },
        },
    },
}
