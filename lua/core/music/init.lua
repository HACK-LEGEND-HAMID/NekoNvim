local M = {}

local function notify(msg, level)
    vim.notify(msg, level or vim.log.levels.INFO, { title = "Music" })
end

function M.play(query)
    if not query or query == "" then
        notify("No music specified", vim.log.levels.WARN)
        return
    end

    M.stop()

    local target

    if query:match("^https?://") then
        target = query
    else
        local file = vim.fn.expand("~/music/" .. query .. ".mp3")

        if vim.fn.filereadable(file) == 1 then
            target = file
        else
            local id = vim.fn.system({
                "yt-dlp",
                "--get-id",
                "ytsearch1:" .. query,
            })

            id = vim.trim(id)

            if vim.v.shell_error ~= 0 or id == "" then
                notify("No results found.", vim.log.levels.ERROR)
                return
            end

            target = "https://www.youtube.com/watch?v=" .. id
        end
    end

    vim.fn.jobstart({
        "mpv",
        "--no-video",
        "--force-window=no",
        "--really-quiet",
        target,
    }, {
        detach = true,
    })

    notify("🎵 Playing: " .. query)
end

function M.stop()
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Windows_NT" then
        vim.fn.system("taskkill /F /IM mpv.exe >NUL 2>&1")
    else
        vim.fn.system("killall mpv 2>/dev/null")
        vim.fn.system("pkill -x mpv 2>/dev/null")
        vim.fn.system("kill -9 $(pgrep mpv) 2>/dev/null")
    end

    notify("⏹️ Stopped")
end

function M.pause()
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Windows_NT" then
        vim.fn.system("powershell -Command \"(Get-Process mpv).Suspend()\"")
    else
        vim.fn.system("pkill -STOP -x mpv 2>/dev/null")
        vim.fn.system("kill -STOP $(pgrep mpv) 2>/dev/null")
    end

    notify("⏸️ Paused")
end

function M.resume()
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Windows_NT" then
        vim.fn.system("powershell -Command \"(Get-Process mpv).Resume()\"")
    else
        vim.fn.system("pkill -CONT -x mpv 2>/dev/null")
        vim.fn.system("kill -CONT $(pgrep mpv) 2>/dev/null")
    end

    notify("▶️ Resumed")
end

return M
