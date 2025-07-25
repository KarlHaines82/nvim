-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@itype LazySpec
return {
  {
    "alex-popov-tech/store.nvim",
    enabled = false,
    dependencies = {
      "OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
    },
    cmd = "Store",
    keys = {
      { "<leader>pz", "<cmd>Store<cr>", desc = "Open Plugin Store" },
    },
    config = function()
      require("store").setup({
        full_name_limit = 40,
        width = 0.9,
        height = 0.8,
        proportions = {
          list = 0.3,     -- 30% for repository list
          preview = 0.7,  -- 70% for preview pane
        },
        modal = {
          border = "rounded",  -- Border style
          zindex = 70,         -- Z-index for modal windows
        },
      })
    end,
  }
}

