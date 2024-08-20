-- Set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set shortcut to go back to normal mode from insert
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Mapping to get back to normal mode from insert' })

-- The other things from my old vim config
vim.opt.hlsearch = true
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search highlighting by pressing escape' })

-- Use line numbers
vim.opt.number = true

-- Keybind to reload the init.vim configs
vim.keymap.set('n', '<Leader>r', '<cmd>source $HOME/.config/nvim/init.lua<CR>', { desc = 'Reload the nvim config' })

-- Case-insensitive searching unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tabbing stuff
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Wrapping stuff
vim.opt.wrap = false

-- Pull run the file in /lua/config/lazy.lua
require("config.lazy")

-- Plugin related keybinds
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
