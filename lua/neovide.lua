if vim.g.neovide then
  vim.g.neovide_fullscreen = false
  vim.cmd [[set gfn=Monaco\ Nerd\ Font:h11]]
  vim.g.neovide_scale_factor = 1.0
  -- create functions for ctrl+- and ctrl++ to adjust fontsize
  local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.25) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.25) end)
  vim.g.neovide_opacity = 0.9
end
