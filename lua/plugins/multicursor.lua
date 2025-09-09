return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        -- Add or skip cursor above/below the main cursor.
        vim.keymap.set({"n", "x"}, "<leader>k", function() mc.lineAddCursor(-1) end, { desc = "Add cursor above" })
        vim.keymap.set({"n", "x"}, "<leader>j", function() mc.lineAddCursor(1) end, { desc = "Add cursor below" })
        vim.keymap.set({"n", "x"}, "<leader>K", function() mc.lineSkipCursor(-1) end, { desc = "Skip cursor above" })
        vim.keymap.set({"n", "x"}, "<leader>J", function() mc.lineSkipCursor(1) end, { desc = "Skip cursor below" })

        -- Add or skip adding a new cursor by matching word/selection
        vim.keymap.set({"n", "x"}, "<leader>ma", function() mc.matchAddCursor(1) end, { desc = "Add cursor on next match" })
        vim.keymap.set({"n", "x"}, "<leader>ms", function() mc.matchSkipCursor(1) end, { desc = "Skip next match" })
        vim.keymap.set({"n", "x"}, "<leader>mA", function() mc.matchAddCursor(-1) end, { desc = "Add cursor on prev match" })
        vim.keymap.set({"n", "x"}, "<leader>mS", function() mc.matchSkipCursor(-1) end, { desc = "Skip prev match" })

        -- Add and remove cursors with control + left click.
        vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
        vim.keymap.set("n", "<c-leftdrag>", mc.handleMouseDrag)
        vim.keymap.set("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Disable and enable cursors.
        vim.keymap.set({"n", "x"}, "<leader>mt", mc.toggleCursor, { desc = "Toggle multicursor" })

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one.
            layerSet({"n", "x"}, "<left>", mc.prevCursor)
            layerSet({"n", "x"}, "<right>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end
}
