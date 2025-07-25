-- if true then return {} end -- WARN: THIS BITCH IS DISABLED

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "mypy",
        "pyright",
        "lua-language-server",
        "shellcheck",

        -- install formatters
        -- "stylua",
        "prettier",
        "black",
        "beautysh",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
