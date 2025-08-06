return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "clangd",
      "jdtls",
      "lua_ls",
    },
    automatic_enable = false,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              exclude = { "build" },
            },
          },
        },
      },
      clangd = {},
      jdtls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }
    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end

    -- Ensure the servers and tools above are installed
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { "stylua" })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
  end,
}
