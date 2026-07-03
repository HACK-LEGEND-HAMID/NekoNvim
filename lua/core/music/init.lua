local M = {}

function M.play(query)
    if not query or query == "" then return end
    if query:match("^https?://") then
        vim.fn.jobstart({ "mpv", "--no-video", query }, { detach = true })
    else
        local local_file = vim.fn.expand("~/music/" .. query .. ".mp3")
        if vim.fn.filereadable(local_file) == 1 then
            vim.fn.jobstart({ "mpv", "--no-video", local_file }, { detach = true })
        else
            vim.fn.jobstart({ "mpv", "--no-video", "ytdl://ytsearch:" .. query }, { detach = true })
        end
    end
    vim.notify("🎵 Playing: " .. query)
end

function M.stop()
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Linux" or os_name == "Darwin" then
        vim.fn.system("kill -9 $(pgrep mpv) 2>/dev/null")
    elseif os_name == "Windows_NT" then
        vim.fn.system("taskkill /F /IM mpv.exe 2>NUL")
    end
    vim.notify("⏹️ Stopped")
end

function M.pause()
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Linux" or os_name == "Darwin" then
        vim.fn.system("kill -STOP $(pgrep mpv) 2>/dev/null")
    elseif os_name == "Windows_NT" then
        vim.fn.system("powershell -Command \"(Get-Process mpv).Suspend()\"")
    end
    vim.notify("⏸️ Paused")
end

function M.resume()
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Linux" or os_name == "Darwin" then
        vim.fn.system("kill -CONT $(pgrep mpv) 2>/dev/null")
    elseif os_name == "Windows_NT" then
        vim.fn.system("powershell -Command \"(Get-Process mpv).Resume()\"")
    end
    vim.notify("▶️ Resumed")
end

return M
