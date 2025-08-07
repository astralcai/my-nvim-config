return {
  "saghen/blink.cmp",
  dependencies = {
    "folke/lazydev.nvim",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = "default" },

    -- Completion settings
    completion = {
      accept = { auto_brackets = { enabled = false } },
      menu = { draw = { treesitter = { "lsp" } } },
    },

    -- Set sources
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },

    -- Configure snippets
    snippets = { preset = "luasnip" },

    -- Enable signature help
    signature = { enabled = true },
  },
}
