return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
        keymap = { preset = "enter" },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
        completion = {
            documentation = { auto_show = true },
        },
    },
    opts_extend = { "sources.default" },
}
