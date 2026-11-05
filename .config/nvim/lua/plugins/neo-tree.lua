return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_default",
      follow_current_file = { enabled = true },
    },
    window = {
      position = "right",
      width = 30,
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    vim.api.nvim_create_user_command("Explore", "Neotree focus right", {})
  end,
}
