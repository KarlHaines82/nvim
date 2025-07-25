-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local neovimascii = require("linuxkarl.neovimascii")

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  { "andweeb/presence.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { 'ibhagwan/fzf-lua' },
  -- Lazy.nvin spec
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    cmd = 'Nerdy',
    opts = {
      max_recents = 30, -- Configure recent icons limit
      add_default_keybindings = true, -- Add default keybindings
      use_new_command = true, -- Enable new command system
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  },
  -- lazy.nvim spec
  -- {
  --   'JunYang-tes/gemini-nvim',
  --   config = function()
  --     require('gemini-nvim').setup({
  --       -- Your configuration goes here
  --       window_style = "side",
  --       side_position = "left",
  --     })
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      -- dashboard = {preset = {header = table.concat(ascii.art.categories.text.neovim.sharp, "\n")}}
      dashboard = {
        preset = {
          header = "\n" ..
            table.concat(neovimascii.bloody, "\n") .. "\n" ..
            "neovim config by linuxkarl\n" .. 
            "baaed on astronvim template"
        }
      }
    },
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
