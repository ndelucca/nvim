return {
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/dev', '~/Downloads', '/' },
            session_lens = {
                load_on_setup = true,
                theme_conf = {
                    layout_config = {
                        theme = "dropdown",
                        hidden = true
                    },
                },
                mappings = {
                    delete_session = { "i", "<C-D>" },
                    alternate_session = { "i", "<C-S>" },
                    copy_session = { "i", "<C-Y>" },
                },
            },
        }
    }
}
