require("config.lazy")

-- Set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set shortcut to go back to normal mode from insert
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Mapping to get back to normal mode from insert'})

-- The other things from my old vim config
vim.opt.hlsearch = true
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search highlighting by pressing escape'})

-- Use system keyboard
vim.opt.clipboard = 'unnamedplus'

-- Use line numbers
vim.opt.number = true 

-- Keybind to reload the init.vim configs
vim.keymap.set('n', '<Leader>r', '<cmd>source $HOME/.config/nvim/init.lua<CR>', { desc = 'Reload the nvim config'})

-- Case-insensitive searching unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Not too sure what this is honestly
vim.opt.inccommand = 'split'

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

-- For the colorscheme!
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
