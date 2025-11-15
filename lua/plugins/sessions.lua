return {
    {
        'rmagatti/auto-session',
        lazy = true,
        event = "VimEnter",
        cond = not vim.g.vscode,
        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/dev', '~/Downloads', '/' },
        }
    }
}
