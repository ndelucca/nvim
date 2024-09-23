require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
})

require('Comment').setup({
    toggler = {
        line = '<leader>c',
    },
    opleader = {
        line = '<leader>c',
    },
    mappings = {
        basic = true,
        extra = false,
    },
})
