return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Set up telescope and extensions
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("frecency")
    require("telescope").load_extension("ui-select")
    local builtin = require("telescope.builtin")

    -- Custom functions
    local current_buffer_dropdown = function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        inblend = 10,
        previewer = false,
      }))
    end

    -- Configure keymaps
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Current Buffers" })
    vim.keymap.set("n", "<leader>/", current_buffer_dropdown, { desc = "[/] Search in Current Buffer" })
  end,
}
