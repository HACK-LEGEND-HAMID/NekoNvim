local map = vim.keymap.set
vim.g.mapleader = " "

-- Save
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { silent = true })

-- Quit
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })

-- Window navigation
map("n", "<C-l>", "<C-w>h")
map("n", "<C-b>", "<C-w>j")
map("n", "<C-u>", "<C-w>k")
map("n", "<C-r>", "<C-w>l")

map("n", "ch", ":split<CR>", { desc = "Horizontal Split" })
map("n", "cv", ":vsplit<CR>", { desc = "Vertical Split" })

