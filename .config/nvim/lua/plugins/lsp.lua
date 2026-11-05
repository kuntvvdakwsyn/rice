return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.enable({
      "clangd",
      "nil_ls",
      "pyright",
      "lua_ls",
    })
  end,
}
