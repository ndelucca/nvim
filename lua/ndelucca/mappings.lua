local nmap = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { desc = desc })
end

-- General
nmap("<F5>", vim.cmd.checktime)
-- File explorer
local function open_files_current()
    local bufpath = vim.fn.expand("%:p:h")
    local path = (bufpath ~= "") and bufpath or vim.loop.cwd()
    require("mini.files").open(path)
end
nmap("-", open_files_current, "File explorer")

-- LSP
nmap("<leader>la", vim.lsp.buf.code_action, "Actions")
nmap("<leader>ld", vim.diagnostic.open_float, "Diagnostic popup")
nmap("<leader>lf", function() require("conform").format({ timeout_ms = 3000, lsp_fallback = true }) end, "Format")
nmap("<leader>li", vim.lsp.buf.implementation, "Implementation")
nmap("<leader>lh", vim.lsp.buf.hover, "Hover")
nmap("<leader>lr", vim.lsp.buf.rename, "Rename")
nmap("<leader>lR", vim.lsp.buf.references, "References")
nmap("<leader>ls", vim.lsp.buf.definition, "Source definition")
nmap("<leader>lt", vim.lsp.buf.type_definition, "Type definition")

-- Pickers
local pick = require("mini.pick")
local builtin = pick.builtin
local buffer_ui = require("buffer_manager.ui")

-- Git detection (sync, fast, no stdout parsing)
local function in_git_repo()
    return vim.system({ "git", "rev-parse", "--is-inside-work-tree" }):wait().code == 0
end

-- Smart file picker
local function smart_files()
    if in_git_repo() then
        builtin.cli({
            command = { "bash", "-c", "git ls-files && git ls-files --others --exclude-standard" },
            prompt = "Git files",
        })
    else
        builtin.files({ show_hidden = true })
    end
end

-- Pickers mappings
nmap("<leader>ff", smart_files, "Smart files")
nmap("<leader>f/", function() builtin.history({ scope = "/" }) end, '"/" history')
nmap("<leader>f:", function() builtin.history({ scope = ":" }) end, '":" history')
nmap("<leader>fa", function() builtin.git_hunks({ scope = "staged" }) end, "Added hunks (all)")
nmap("<leader>fA", function() builtin.git_hunks({ path = "%", scope = "staged" }) end, "Added hunks (buf)")
nmap("<leader>fd", function() builtin.diagnostic({ scope = "current" }) end, "Diagnostic buffer")
nmap("<leader>fg", function() builtin.grep_live({ show_hidden = true }) end, "Live grep")
nmap("<leader>fG", function() builtin.grep({ show_hidden = true, pattern = vim.fn.expand("<cword>") }) end, "Grep word")
nmap("<leader>fh", builtin.help, "Help tags") nmap("<leader>fb", buffer_ui.toggle_quick_menu, "Buffer manager")
nmap("<leader>fB", builtin.buffers, "Buffers")
-- Buffers
local bufremove = require("mini.bufremove")
nmap("<leader>bj", vim.cmd.bprev, "Previous buffer")
nmap("<leader>bk", vim.cmd.bnext, "Next buffer")
nmap("<leader>ba", vim.cmd.bprevious, "Alternate")
nmap("<leader>bd", bufremove.delete, "Delete")
nmap("<leader>bD", function() bufremove.delete(0, true) end, "Delete!")
nmap("<leader>bw", bufremove.wipeout, "Wipeout")
nmap("<leader>bW", function() bufremove.wipeout(0, true) end, "Wipeout!")
-- Terminal
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true })
nmap("tT", function() vim.cmd("horizontal term") end, "Terminal (horizontal)")
nmap("tt", function() vim.cmd("vertical term") end, "Terminal (vertical)")
-- Custom command
vim.api.nvim_create_user_command("ToggleSplitStruct", function()
    require("mini.splitjoin").toggle()
end, { desc = "Splits or folds a multi-value data structure" })
