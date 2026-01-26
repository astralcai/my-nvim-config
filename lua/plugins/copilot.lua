return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = {
        keymap = {
          accept = "<C-]>",
          accept_word = "<C-M>",
          accept_line = "<C-L>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-Q>",
          toggle_auto_trigger = false,
        },
      },
    })
    vim.keymap.set("n", "<leader>co", function()
      require("copilot.suggestion").toggle_auto_trigger()
    end, { desc = "Toggle Copilot" })
  end,
}
