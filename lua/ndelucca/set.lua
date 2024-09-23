vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fileformats = "unix"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

-- vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append('unnamedplus')

vim.opt.eof = true
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function(ev)
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
