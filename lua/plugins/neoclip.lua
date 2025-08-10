return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "ibhagwan/fzf-lua" },
  config = function()
    require("neoclip").setup()
    vim.keymap.set("n", "<leader>sc", require("neoclip.fzf"), { desc = "[S]earch [C]lipboard" })
  end,
}
