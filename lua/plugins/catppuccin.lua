return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      styles = {
        comments = {},
        conditionals = {},
      },
      background = {
        light = "latte",
        dark = "macchiato",
      },
      auto_integrations = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
