return {
    {
        'nvim-lua/plenary.nvim'
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local fb_actions = require "telescope".extensions.file_browser.actions
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep cursor' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

            vim.keymap.set("n", "_", ":Telescope file_browser<CR>")
            vim.keymap.set("n", "-", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

            require('telescope').setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg", "--no-heading", "--with-filename",
                        "--line-number", "--column", "--smart-case", "--no-binary",
                        "--hidden"
                    },
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = { horizontal = { preview_width = 0.5 } },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    }
}
