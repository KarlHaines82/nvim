return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function()
    return {
      sources = { "filesystem" },
      source_selector = {
        winbar = false,
        statusline = true,
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  end,
  cmd = function()
    return "Neotree"
  end,
  keys = function()
    return {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    }
  end,
}
