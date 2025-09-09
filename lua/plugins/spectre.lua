return {
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("spectre").setup({})
            vim.keymap.set('n', '<leader>rr', '<cmd>lua require("spectre").toggle()<CR>', {
                desc = "Find and replace"
            })
            vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
                desc = "Replace word"
            })
        end,
    }
}
