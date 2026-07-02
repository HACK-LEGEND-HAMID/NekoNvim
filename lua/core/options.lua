local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- UI
opt.mouse = "a"
opt.cursorline = true
opt.termguicolors = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- default snippet off
vim.g.loaded_nvim_snippet = false
