return {
    { 'nvim-lua/plenary.nvim' },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local live_grep_args = require("telescope").extensions.live_grep_args
            local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

            vim.keymap.set("n", "<leader>fg", live_grep_args_shortcuts.grep_word_under_cursor)
            vim.keymap.set("n", "<leader>fG", live_grep_args_shortcuts.grep_visual_selection)
            vim.keymap.set("n", "<leader>fs", live_grep_args.live_grep_args)

            require('telescope').setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg", "--no-heading", "--with-filename",
                        "--line-number", "--column", "--smart-case", "--no-binary",
                        "--hidden", "--glob", "!.git/**"
                    },
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = { horizontal = { preview_width = 0.5 } },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        confif = function()
            require('telescope').load_extension("live_grep_args")
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("spectre").setup({})
            vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").toggle()<CR>', {
                desc = "Toggle Spectre"
            })
            vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
                desc = "Search current word"
            })
            vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
                desc = "Search current word"
            })
            vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
                desc = "Search on current file"
            })
        end,
    }
}
