return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "[F]ormat Buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = function(bufnr)
        local has_ruff = require("conform").get_formatter_info("ruff_format", bufnr).available
        return has_ruff and { "ruff_organize_imports", "ruff_format" } or { "isort", "black" }
      end,
      toml = { "tombi" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
