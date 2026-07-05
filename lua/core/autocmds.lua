-- lua/core/autocmds.lua
-- Auto Commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = augroup("CoreAutoCmds", { clear = true })

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Restore last cursor position
autocmd("BufReadPost", {
    group = group,
    pattern = "*",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 1 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
    group = group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-- Clean terminal window
autocmd("TermOpen", {
    group = group,
    pattern = "*",
    command = "setlocal nonumber norelativenumber signcolumn=no",
})

-- Equalize splits on resize
autocmd("VimResized", {
    group = group,
    pattern = "*",
    command = "wincmd =",
})

-- 2-space indentation
autocmd("FileType", {
    group = group,
    pattern = {
        "lua",
        "python",
        "ruby",
        "vim",
        "yaml",
        "toml",
        "json",
        "jsonc",
        "html",
        "css",
        "scss",
        "less",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "svelte",
        "graphql",
        "elixir",
        "erlang",
        "haskell",
        "nim",
    },
    command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})

-- 4-space indentation
autocmd("FileType", {
    group = group,
    pattern = {
        "c",
        "cpp",
        "java",
        "go",
        "rust",
        "zig",
        "dart",
        "swift",
        "kotlin",
        "scala",
        "cs",
        "php",
        "perl",
        "r",
        "julia",
        "matlab",
    },
    command = "setlocal tabstop=4 shiftwidth=4 expandtab",
})

-- 8-space / real tabs
autocmd("FileType", {
    group = group,
    pattern = {
        "make",
        "gitcommit",
        "gitconfig",
        "gitrebase",
    },
    command = "setlocal tabstop=8 shiftwidth=8 noexpandtab",
})

-- Reload if file changed outside
autocmd("FocusGained", {
    group = group,
    pattern = "*",
    command = "checktime",
})

-- Markdown writing mode
autocmd("FileType", {
    group = group,
    pattern = "markdown",
    command = "setlocal wrap linebreak spell spelllang=en_us",
})

-- Terminal: start in insert mode
autocmd("TermOpen", {
    group = group,
    pattern = "*",
    command = "startinsert",
})

-- Close preview on completion done
autocmd("CompleteDone", {
    group = group,
    pattern = "*",
    callback = function()
        pcall(vim.api.nvim_close_win, 0)
    end,
})

-- Auto-format on save
autocmd("BufWritePre", {
    group = group,
    pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx", "*.html", "*.css", "*.json", "*.yaml", "*.c", "*.cpp", "*.java", "*.go", "*.rs" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Auto-change directory to current file's folder
autocmd("BufEnter", {
    group = group,
    pattern = "*",
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname ~= "" then
            vim.cmd("silent! lcd " .. vim.fn.fnamemodify(bufname, ":h"))
        end
    end,
})
