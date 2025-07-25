--- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

--@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {},
      },
    },
  },
  keys = {
    { "<tab>", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree window", mode = "n" }
  }
}
