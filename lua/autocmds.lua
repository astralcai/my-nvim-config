-- [[ Basic Autocommands]]

-- Highlight yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Tab settings for files.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TabWidth", { clear = true }),
  pattern = { "c", "cpp", "lua", "toml" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
