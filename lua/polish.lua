-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--
if vim.g.neovide then
	require("neovide")
end
--
-- Setup local vim options
local o = vim.opt
--
o.cmdheight = 1
o.relativenumber = false
o.autochdir = true
o.pumblend = 30
o.winblend = 30
