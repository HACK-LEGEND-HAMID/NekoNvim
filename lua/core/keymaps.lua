local map = vim.keymap.set
vim.g.mapleader = " "

-- Save
map("n", "<C-s>", ":w<CR>", { desc = "Save" })

-- Quit
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
