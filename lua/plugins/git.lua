return {
    {
        "NeogitOrg/neogit",
        cond = not vim.g.vscode,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-mini/mini.pick",
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        cond = not vim.g.vscode,
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
            })
        end
    }
}
