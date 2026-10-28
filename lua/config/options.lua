-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
-- Neovim native options
--
local o = vim.opt

o.relativenumber = false
o.autochdir = true
o.gfn = "Agave Nerd Font:h11"

--
-- Global settings
--
vim.g.tokyonight_transparent_background = true

----------------------------------------------------------
--
-- Neovide settings
--
if vim.g.neovide then
  -- ime preedit handling
  local ime_context = {
    base_col = 0,
    base_row = 0,
    preedit_col = 0,
    preedit_row = 0,
  }
  ---@param preedit_raw_text string
  ---@param cursor_offset [integer, integer]: [start_col, end_col]
  preedit_handler = function(preedit_raw_text, cursor_offset)
    vim.api.nvim_buf_set_text(
      0,
      ime_context.base_row - 1,
      ime_context.base_col,
      ime_context.preedit_row - 1,
      ime_context.preedit_col,
      {}
    )
    ime_context.preedit_col = ime_context.base_col + string.len(preedit_raw_text)
    vim.api.nvim_buf_set_text(
      0,
      ime_context.base_row - 1,
      ime_context.base_col,
      ime_context.base_row - 1,
      ime_context.base_col,
      { preedit_raw_text }
    )
    vim.api.nvim_win_set_cursor(0, { ime_context.preedit_row, ime_context.preedit_col })
  end
  -- set some options
  vim.g.neovide_normal_opacity = 0.85
  vim.g.neovide_window_blurred = true
  vim.g.neovide_corner_preference = "round"
  vim.g.neovide_floating_blur_amount_x = 9.0
  vim.g.neovide_floating_blur_amount_y = 7.0
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_particle_density = 1.2
  vim.g.neovide_cursor_vfx_particle_lifetime = 2.2
  -- scale stuff
  vim.g.neovide_scale_factor = 1.0
  -- add keymaps to change the scale factor
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
