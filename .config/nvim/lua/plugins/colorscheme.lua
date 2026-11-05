return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                light_style = "day",
                transparent = false,
                terminal_colors = true,

                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })

            vim.cmd.colorscheme("tokyonight-storm")
        end,
    },
}
