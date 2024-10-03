return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep cursor' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

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
