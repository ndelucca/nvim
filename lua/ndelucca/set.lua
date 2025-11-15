vim.opt.iskeyword:remove(":")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- List chars only in standalone Neovim
if not vim.g.vscode then
    vim.opt.list = true
    vim.opt.listchars = { tab = "->", trail = '·' }
end

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
vim.opt.virtualedit = "block"

-- UI settings only for standalone Neovim
if not vim.g.vscode then
    vim.opt.signcolumn = "yes"
    vim.opt.inccommand = "split"
    vim.opt.updatetime = 50
    vim.opt.termguicolors = true
    vim.opt.colorcolumn = "100"
end

if os.getenv("DISPLAY") or os.getenv("WAYLAND_DISPLAY") then
    vim.opt.clipboard = "unnamedplus"
end

-- Standalone Neovim specific settings
if not vim.g.vscode then
    vim.opt.eof = true

    -- Auto-trim trailing whitespace on save
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = { "*" },
        callback = function(ev)
            local save_cursor = vim.fn.getpos(".")
            vim.cmd([[%s/\s\+$//e]])
            vim.fn.setpos(".", save_cursor)
        end,
    })

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
end

vim.diagnostic.config {
    underline = false,
    virtual_text = false
}

