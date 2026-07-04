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

-- HTML Live Preview (Universal Python HTTP Server)
local function html_preview()
    local file = vim.fn.expand("%:p")
    local dir = vim.fn.expand("%:p:h")
    local fname = vim.fn.expand("%:t")
    local os_name = vim.loop.os_uname().sysname

    vim.fn.system("pkill -f 'python3 -m http.server 8080' 2>/dev/null")
    vim.fn.jobstart(
        { "python3", "-m", "http.server", "8080", "-d", dir },
        { detach = true }
    )

    vim.fn.system("sleep 1")
    if os_name == "Linux" then
        if vim.fn.getenv("TERMUX_VERSION") ~= vim.NIL then
            vim.fn.jobstart({ "termux-open-url", "http://localhost:8080/" .. fname })
        else
            vim.fn.jobstart({ "xdg-open", "http://localhost:8080/" .. fname })
        end
    elseif os_name == "Darwin" then
        vim.fn.jobstart({ "open", "http://localhost:8080/" .. fname })
    elseif os_name == "Windows_NT" then
        vim.fn.jobstart({ "cmd", "/c", "start", "http://localhost:8080/" .. fname })
    end
end

map("n", "<leader>P", html_preview, { desc = "HTML Preview" })


-- Snippet expand with Ctrl+E
vim.keymap.set({ "i", "s" }, "<C-e>", function()
    local ls = require("luasnip")
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })


-- 🎵 Music Player
map("n", "<leader>mp", function()
    pcall(function()
        require("core.music").play(vim.fn.input("🎵 Song/URL: "))
    end)
end, { desc = "Play Music" })

map("n", "<leader>ms", function()
    pcall(function()
        require("core.music").stop()
    end)
end, { desc = "Stop Music" })

map("n", "<leader>mP", function()
    pcall(function()
        require("core.music").pause()
    end)
end, { desc = "Pause Music" })

map("n", "<leader>mr", function()
    pcall(function()
        require("core.music").resume()
    end)
end, { desc = "Resume Music" })

map("n", "<leader>my", function()
    pcall(function()
        require("core.music.stream").youtube(vim.fn.input("🔍 YouTube: "))
    end)
end, { desc = "YouTube Search" })

map("n", "<leader>mu", function()
    pcall(function()
        require("core.music.stream").play_url(vim.fn.input("🔗 URL: "))
    end)
end, { desc = "Play URL" })


-- Git
map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })


