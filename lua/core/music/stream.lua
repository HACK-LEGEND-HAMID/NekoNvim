local M = {}

function M.play_url(url)
    vim.fn.jobstart({ "mpv", "--no-video", url }, { detach = true })
    vim.notify("🎵 Streaming: " .. url)
end

function M.youtube(query)
    vim.fn.jobstart({ "mpv", "--no-video", "ytdl://ytsearch:" .. query }, { detach = true })
    vim.notify("🔍 YouTube: " .. query)
end

function M.soundcloud(query)
    vim.fn.jobstart({ "mpv", "--no-video", "ytdl://scsearch:" .. query }, { detach = true })
    vim.notify("☁️ SoundCloud: " .. query)
end

return M
