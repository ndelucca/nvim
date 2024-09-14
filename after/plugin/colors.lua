vim.opt.termguicolors = true

function SetColor(color)
    color = color or "jellybeans" 
    vim.cmd.colorscheme(color)
end

SetColor()
