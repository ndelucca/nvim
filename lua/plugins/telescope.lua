return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader><C-f>', builtin.grep_string, {})
            vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})

            require('telescope').setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg", "--no-heading", "--with-filename",
                        "--line-number", "--column", "--smart-case", "--no-binary",
                        "--hidden"
                    },
                },
                pickers = {
                    git_files = { theme = "dropdown", hidden = true },
                    find_files = { theme = "dropdown", hidden = true },
                    grep_string = { theme = "dropdown", hidden = true },
                    live_grep = { theme = "dropdown", hidden = true },
                    buffers = {
                        theme = "dropdown",
                        file_ignore_patterns = { "^%[No Name%]$", "^%.$" }
                    }
                },
            })
        end,
    },
}
