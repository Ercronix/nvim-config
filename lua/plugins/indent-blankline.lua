return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
        local hooks = require("ibl.hooks")

        -- Create highlight groups
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- Subtle indent line color
            vim.api.nvim_set_hl(0, "IndentLine", { fg = "#3b4261" }) -- soft gray (Tokyonight style)

            -- Active scope color (function you're inside)
            vim.api.nvim_set_hl(0, "ScopeLine", { fg = "#7aa2f7", bold = true })
        end)

        require("ibl").setup({
            indent = {
                char = "│",
                tab_char = "│",
                highlight = "IndentLine", -- single neutral color
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
                highlight = "ScopeLine", -- ONLY active scope is colored
            },
            exclude = {
                filetypes = {
                    "help",
                    "dashboard",
                    "lazy",
                    "mason",
                    "oil",
                    "trouble",
                    "toggleterm",
                    "TelescopePrompt",
                    "NvimTree",
                    "alpha",
                },
            },
        })
    end,
}
