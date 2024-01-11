vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap.set

-- Common keymaps
keymap('v', 'p', 'P', { desc = "Switch paste mode, do not change clipboard" })
keymap('v', 'P', 'p', { desc = "Switch paste mode change clipboard" })

--- Switch Mode
keymap({ 'i', 'v' }, 'jk', '<esc>', { desc = "Normal Mode" })
keymap({ 'i', 'v' }, 'kj', '<esc>', { desc = "Normal Mode" })

-- Save & Quit
keymap({ "n", "i" }, '<leader>qq', '<cmd>qa<cr>', { desc = "Quit all" })
keymap({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = "Save file" })

-- Move lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--Move to the windows using <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
keymap("n", "<leader>bpo", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
keymap("n", "<S-x>", "<Cmd>bd<CR>", { desc = "Delete current buffer" })
keymap("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete current buffer" })


-- Neo-tree
keymap({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer NeoTree (cwd)" })
keymap({ "n", "v" }, "<leader>ge", "<cmd>Neotree source=git_status toggle<cr>", { desc = "Git explorer" })

-- Telescope
--- find files
keymap("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Find Recent Files" })

-- in normal mode:
-- d	delete currently selected project
-- r	rename currently selected project
-- c	create a project
-- s	search inside files within your project
keymap("n", "<leader>fp", "<Cmd>Telescope project<CR>", { desc = "Telescope project" })

-- Mason
keymap("n", "<leader>ms", "<Cmd>Mason<CR>", { desc = "Mason" })

-- Treesitter
-- nvim Treesitter context
keymap("n", "<leader>tct", "<Cmd>TSContextToggle<CR>", {desc = "Treesitter context toggle"} )
