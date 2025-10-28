return {
    {
        'rmagatti/auto-session',
        lazy = true,
        event = "VimEnter",
        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/dev', '~/Downloads', '/' },
        }
    }
}
