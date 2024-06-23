-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

	-- == Examples of Adding Plugins ==

	"andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "storm",
				transparent = true,
				terminal_colors = true,
				-- disable italic for functions
				sidebars = { "qf", "vista_kind", "terminal", "packer", "gen" },
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.hint = colors.orange
					colors.error = "#ff0000"
				end,
			})
		end,
	}, -- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				"" .. "" .. "" .. "                                        u            @88>                    ",
				"   u.    u.                     u.    88Nu.   u.     8P      ..    .     :   ",
				" x@88k u@88c.      .u     ...ue888b  '88888.o888c    .     .888: x888  x888. ",
				"^'8888''8888'   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~'888X`?888f`",
				"  8888  888R  :888'8888.  888R I888>   8888  8888 ''888E`   X888  888X '888> ",
				"  8888  888R  d888 '88 '  888R I888>   8888  8888   888E    X888  888X '888> ",
				"  8888  888R  8888.+'     888R I888>   8888  8888   888E    X888  888X '888> ",
				"  8888  888R  8888L      u8888cJ888   .8888b.888P   888E    X888  888X '888> ",
				" '*88*' 8888' '8888c. .+  '*888*P'     ^Y8888*''    888&   '*88  ''*88''888!'",
				"   ''   'Y'    'i88888       'Y'          `Y;       R888'    `~    ''    ``  ",
				"                 'YP'                                ''                      ",
				"               linuxkarl's neovim config (astronvim setup)                   ",
				"",
				"",
			}
			return opts
		end,
	},
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},
	-- You can disable default plugins as follows:
	-- You can also easily customize additional setup of plugins that is outside of the plugin"s setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
					-- don't add a pair if the next character is %
							:with_pair(cond.not_after_regex("%%"))
					-- don't add a pair if  the previous character is xxx
							:with_pair(
								cond.not_before_regex("xxx", 3)
							)
					-- don't move right when repeat character
							:with_move(cond.none())
					-- don't delete if the next character is xx
							:with_del(cond.not_after_regex("xx"))
					-- disable adding a newline when you press <cr>
							:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

			require("neo-tree").setup({
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						always_show = { "**" },
					},
				},
			})
		end,
	},
	{ "nvim-telescope/telescope-symbols.nvim" },
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "codellama", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "11434",   -- The port on which the Ollama service is listening.
			quit_map = "q",   -- set keymap for close the response window
			retry_map = "<c-r>", -- set keymap to re-send the current prompt
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				local body = {
					model = options.model,
					stream = true,
				}
				return "curl --silent --no-buffer -X POST http://"
						.. options.host
						.. ":"
						.. options.port
						.. "/api/chat -d $body"
			end,
			display_mode = "split", -- The display mode. Can be "float" or "split".
			show_prompt = true,  -- Shows the prompt submitted to Ollama.
			show_model = true,   -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			debug = false,       -- Prints errors and the command which is run.
		},
	},
}
