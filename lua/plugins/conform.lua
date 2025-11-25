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
  opts = function()
    local global_opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        toml = { "tombi" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    }
    local local_config_path = vim.fs.find({ ".conform.lua" }, {
      path = vim.fn.getcwd(),
      upward = true,
      limit = 1,
      stop = vim.loop.os_homedir(),
    })[1]
    if local_config_path then
      if vim.loop.fs_stat(local_config_path) then
        local f = assert(loadfile(local_config_path))
        local local_opts = f()
        return vim.tbl_deep_extend("force", global_opts, local_opts)
      end
    end
    return global_opts
  end,
}
