require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "I hate pushing ESC" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Command-S save file" })
map("n", "j", "gj", { desc = "Navigate visual lines (down)" })
map("n", "j", "gk", { desc = "Navigate visual lines (up)" })
