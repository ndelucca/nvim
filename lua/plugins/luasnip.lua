return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

        local ls = require("luasnip")

        vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true })
    end,
}
