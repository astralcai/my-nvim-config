return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 500,
    spec = {
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
}
