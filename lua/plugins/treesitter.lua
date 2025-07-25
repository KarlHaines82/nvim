-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- Customize Treesitter

---@type LazySpec
return {
  {
    "OXY2DEV/markview.nvim",
    opts = {
      experimental = { check_rtp = false, },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      },
    }
  }
}
