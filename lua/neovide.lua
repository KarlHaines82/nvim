if vim.g.neovide then
	-- set font
	vim.g.neovide_scale_factor = 1.0
	vim.cmd([[set gfn=Agave\ Nerd\ Font:h8]])
	vim.cmd([[set gfw=Noto\ Color\ Emoji:h8]])
	-- setup some transparency
	vim.g.neovide_transparency = 0.9
	vim.g.neovide_floating_blur_amount_x = 6.0
	vim.g.neovide_floating_blur_amount_y = 6.0
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
	-- setup cool neovide shit
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_vfx_particle_lifetime = 4.0
	vim.g.neovide_cursor_vfx_particle_density = 18.0
	vim.g.neovide_cursor_vfx_particle_speed = 12.0
	-- setup some expected functionalities
	vim.keymap.set("n", "<D-s>", ":w<CR>")     -- Save
	vim.keymap.set("v", "<D-c>", '"+y')        -- Copy
	vim.keymap.set("n", "<D-v>", '"+P')        -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P')        -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+")     -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
	-- Allow clipboard copy paste in neovim
	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	-- setup font up/downsizing wityh ctrl- and ctrl+
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.10)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.10)
	end)
end
