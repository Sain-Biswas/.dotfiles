return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
        require("rose-pine").setup({
            variant = "main",      -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            highlight_groups = {
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
        })
    end
}
