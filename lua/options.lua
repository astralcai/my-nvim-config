-- [[ Basic Options ]]

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use nerd font
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Wrapped lines have the same indentation
vim.o.breakindent = true

-- Highlight the line that the cursor is on
vim.o.cursorline = true

-- Use OS clipboard in Neovim.
vim.o.clipboard = "unnamedplus"

-- Ask confirmation to save current buffer before quitting
vim.o.confirm = true

-- Ignore case in search patterns
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview substitutions live
vim.o.inccommand = "split"

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·" }

-- Use OS clipboard for Neovim.
vim.o.clipboard = "unnamedplus"

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set default tab width
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Enable mouse support
vim.o.mouse = "a"

-- Minimal number of lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Do not show mode
vim.o.showmode = false

-- Keep signcolumn on
vim.o.signcolumn = "yes"

-- Default position of split windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Decrease update time
vim.o.updatetime = 250

-- Save undo history
vim.o.undofile = true

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300
