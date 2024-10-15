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
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

            vim.keymap.set("n", "<leader>fg", live_grep_args_shortcuts.grep_word_under_cursor)
            vim.keymap.set("n", "<leader>fG", live_grep_args_shortcuts.grep_visual_selection)
            vim.keymap.set("n", "<leader>fs", live_grep_args.live_grep_args)

            vim.keymap.set("n", "<leader>-", ":Telescope file_browser<CR>")
            vim.keymap.set("n", "-", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

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
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
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
        end,
    }
}
