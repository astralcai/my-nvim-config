return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = { "--log-level", "DEBUG" },
        }),
      },
      discovery = {
        enabled = false,
      },
    })
    local neotest = require("neotest")
    vim.keymap.set("n", "<leader>tr", neotest.run.run, { desc = "[R]un [T]est" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "[T]est [F]ile" })
    vim.keymap.set("n", "<leader>tt", neotest.run.stop, { desc = "[T]erminate [T]est" })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle [T]est [S]ummary" })
    vim.keymap.set("n", "<leader>to", neotest.output_panel.toggle, { desc = "Toggle [T]est [O]utput" })
    vim.keymap.set("n", "<leader>tc", neotest.output_panel.clear, { desc = "[C]lear Outout" })
    vim.keymap.set("n", "<leader>dt", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "[D]ebug [T]est" })
  end,
}
