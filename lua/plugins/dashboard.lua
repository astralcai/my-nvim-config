return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        project = { action = 'FzfLua files cwd=' }
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
