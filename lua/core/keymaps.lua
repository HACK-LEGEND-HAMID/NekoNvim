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

 -- Live Previw fot HTML
local function html_preview()
    local file = vim.fn.expand("%:p")
    local dir = vim.fn.expand("%:p:h")
    local fname = vim.fn.expand("%:t")
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Linux" then
        local is_termux = vim.fn.getenv("TERMUX_VERSION") ~= vim.NIL
        if is_termux then
            vim.fn.system("pkill -f 'python3 -m http.server 8080' 2>/dev/null")
            vim.fn.jobstart({ "python3", "-m", "http.server", "8080", "-d", dir }, { detach = true })
            vim.fn.system("sleep 1")
            vim.fn.jobstart({ "termux-open-url", "http://localhost:8080/" .. fname })
        else
            vim.fn.jobstart({ "firefox", file })
        end
    elseif os_name == "Darwin" then
        vim.fn.jobstart({ "open", file })
    elseif os_name == "Windows_NT" then
        vim.fn.jobstart({ "cmd", "/c", "start", file })
    end
end

map("n", "P", html_preview, { desc = "HTML Preview" })

