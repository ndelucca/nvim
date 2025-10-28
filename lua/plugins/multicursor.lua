return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local nxmap = function(lhs, rhs, desc) vim.keymap.set({ 'n', 'x' }, lhs, rhs, { desc = desc }) end
        local mc = require("multicursor-nvim")
        mc.setup()

        nxmap("<C-k>", function() mc.lineAddCursor(-1) end, "Add cursor above")
        nxmap("<C-j>", function() mc.lineAddCursor(1) end, "Add cursor below")
        nxmap("<C-m>", function() mc.matchAddCursor(1) end, "Add cursor on next match")
        nxmap("<C-,>", function() mc.matchSkipCursor(1) end, "Skip next match")

        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
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
