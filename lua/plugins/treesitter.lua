return {
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>is",
                        node_incremental = "<leader>ii",
                        scope_incremental = "<leader>ic",
                        node_decremental = "<leader>id",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
                            ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
                            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                    },
                },
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "javascript", "perl", "python",
                    "go", "css", "yaml", "bash", "json", "markdown", "typescript", "html"
                },
            }
            require('treesitter-context').setup({
                max_lines = 1,
                multiline_threshold = 20,
            })
        end,
    },
}
