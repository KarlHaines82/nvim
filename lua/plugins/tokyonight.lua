return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "transparent",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_colors = function(c)
        c.border = "#f7768e"
      end,
      on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange, bold = true }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
