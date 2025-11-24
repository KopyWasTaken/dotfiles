-- Where my keymappings live

-- Default behavioral stuff
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'jk to escape' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves the visual line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Moves the visual line up" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw (file navigator)" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Appends the line below to the current line" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set('n', 'Q', "<Nop>", { desc = "I don't like macros screwing things up" })
vim.keymap.set('n', '<leader>ec', ':e ~/.config/nvim <CR>') -- Edit config bind
vim.keymap.set('n', '<leader>dv', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Telescope fuzzy finder
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fw', telescope.live_grep, { desc = "Telescope live grep" })

-- Alright I'm not sure what the following do
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Goes to the bottom of the page and ?" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Goes to the top of the page and ?" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "idk man but people say it's goated" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Extend visual mode to search for highlighted text
vim.keymap.set("v", "/", "y/<C-R>\"<CR>", { desc = "Search for highlighted text", remap = true })

-- Running commands and terminal toggles 
vim.keymap.set("n", "!", ":!", { desc = "Run a shell command" })
