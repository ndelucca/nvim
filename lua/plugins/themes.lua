return {
    {
        "Shatur/neovim-ayu",
        name = "ayu",
        config = function()
            require('ayu').setup({
                mirage = false
            })
            vim.cmd("colorscheme ayu")
        end
    },
    -- {
    --     "Mofiqul/dracula.nvim",
    --     name = "dracula",
    --     config = function()
    --         vim.cmd("colorscheme dracula")
    --     end
    -- },
}
