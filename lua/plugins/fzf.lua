return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Configure keymaps
    local fzf = require("fzf-lua")
    fzf.setup({ "telescope" })
    fzf.register_ui_select()
    vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sg", fzf.live_grep_native, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Current Buffers" })
    vim.keymap.set("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Search in Current Buffer" })
  end,
}
