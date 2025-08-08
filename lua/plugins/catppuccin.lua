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
      integrations = {
        dashboard = false,
        dap = false,
        dap_ui = false,
        fidget = false,
        gitsigns = false,
        native_lsp = {
          enabled = false,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        mini = { enabled = false },
        neotree = false,
        neotest = false,
        mason = false,
        telescope = { enabled = false },
        treesitter = false,
        treesitter_context = false,
        which_key = false,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
