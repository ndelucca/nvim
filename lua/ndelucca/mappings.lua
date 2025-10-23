vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix list' })

vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>", { desc = "File explorer" })

vim.keymap.set('n', '<C-p>', function()
    local ok = pcall(MiniExtra.pickers.git_files, {}, {})
    if not ok then
        MiniPick.builtin.files({}, {})
    end
end, { desc = 'Git files or all files' })

vim.keymap.set('n', '<leader>ff', function() MiniPick.builtin.files({}, {}) end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>b', function() MiniPick.builtin.buffers({}, {}) end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fs', function() MiniPick.builtin.grep_live({}, {}) end, { desc = 'Live grep' })

vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<CR>', { desc = 'Blame line' })
vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })

vim.keymap.set({ "n", "x" }, "<leader>z", ":ZenMode<CR>", { desc = "Toggle zen mode" })

local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.api.nvim_create_user_command(
    'ToggleSplitStruct',
    function()
        require('mini.splitjoin').toggle()
    end,
    { desc = "Splits or folds a multi-value data structure." }
)

vim.api.nvim_create_user_command(
    'ShowKeymaps',
    function()
        local keymaps = {}

        -- Get all keymaps for normal mode
        local all_maps = vim.api.nvim_get_keymap('n')

        -- Filter for custom keymaps (those with descriptions or leader keys)
        for _, map in ipairs(all_maps) do
            if map.desc or (map.lhs and (map.lhs:match('^<[Ll]eader>') or map.lhs:match('^%]') or map.lhs:match('^%['))) then
                table.insert(keymaps, {
                    lhs = map.lhs,
                    desc = map.desc or 'No description',
                    rhs = map.rhs or 'Function mapping'
                })
            end
        end

        -- Sort by key
        table.sort(keymaps, function(a, b) return a.lhs < b.lhs end)

        -- Create output
        local output = { "=== Custom Keymaps ===" }
        local categories = {
            ["Leader Keys"] = {},
            ["Other"] = {},
            ["Bracket Navigation"] = {}
        }

        for _, km in ipairs(keymaps) do
            if km.lhs:match('^<[Ll]eader>') then
                table.insert(categories["Leader Keys"], string.format("%-20s %s", km.lhs, km.desc))
            elseif km.lhs:match('^%]') or km.lhs:match('^%[') then
                table.insert(categories["Bracket Navigation"], string.format("%-20s %s", km.lhs, km.desc))
            else
                table.insert(categories["Other"], string.format("%-20s %s", km.lhs, km.desc))
            end
        end

        -- Display categories in specific order
        local category_order = {"Leader Keys", "Other", "Bracket Navigation"}
        for _, category in ipairs(category_order) do
            local maps = categories[category]
            if #maps > 0 then
                table.insert(output, "")
                table.insert(output, "--- " .. category .. " ---")
                for _, map in ipairs(maps) do
                    table.insert(output, map)
                end
            end
        end

        -- Display in a new buffer
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
        vim.api.nvim_buf_set_option(buf, 'filetype', 'text')
        vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
        vim.cmd('split')
        vim.api.nvim_win_set_buf(0, buf)
        vim.cmd('normal! gg')
    end,
    { desc = "Show all custom keymaps organized by category" }
)
