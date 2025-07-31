require 'options' -- load options
require 'keymaps' -- configure keymaps

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  require 'plugins.tokyonight', -- Theme
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  require 'plugins.whick-key', -- Useful plugin to show pending keybinds.
  require 'plugins.telescope', -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.gitsigns', -- Adds gitsigns recommend keymaps
  require 'plugins.oil', -- File Explorer
  require 'plugins.neo-tree', -- File Tree
  require 'plugins.neogit', -- Git Integration
  require 'plugins.lazydev', -- Configures LSP for lua
  require 'plugins.lsp', -- LSP Plugins
  require 'plugins.conform', -- Autoformat
  require 'plugins.blink', -- Autocomplete
  require 'plugins.todo-comments', -- Highlight todo, notes, etc in comments
  require 'plugins.mini', -- Small plugins
  require 'plugins.treesitter', -- Highlight, edit, and navigate code
  require 'plugins.dap', -- Debugger
  require 'plugins.autopairs', -- Auto pair quotes and brakets
  require 'plugins.vim-tmux-navigator', -- Smooth navigation between nvim and tmux
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
