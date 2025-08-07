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
      python = { "isort", "black" },
    },
    formatters = {
      isort = {
        append_args = { "--profile", "black", "-l", "100" },
      },
      black = {
        append_args = { "-l", "100" },
      },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
