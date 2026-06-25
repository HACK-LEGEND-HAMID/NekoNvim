local art = require("core.dashboard.art")

local M = {}

function M.setup()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    
    -- Random art
    dashboard.section.header.val = art.get_random()
    
    -- Buttons
    dashboard.section.buttons.val = {
        dashboard.button("f", "🐟 Find File", ":Telescope find_files<CR>"),
        dashboard.button("n", "🐾 New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("q", "😿 Quit", ":qa<CR>"),
    }
    
    alpha.setup(dashboard.config)
end

return M
