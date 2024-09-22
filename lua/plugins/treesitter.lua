return {
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
            indent = { enable = true },
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "perl",
                "python",
                "go",
                "css",
                "yaml",
                "bash",
                "json",
                "markdown",
                "typescript",
                "html"
            },
        }
    end,
}
