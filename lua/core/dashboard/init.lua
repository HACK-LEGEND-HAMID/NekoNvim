-- lua/core/dashboard/init.lua
-- 🐱 Kitty Dashboard

local M = {}

function M.setup()
    -- Random seed for true randomness
    math.randomseed(os.time() + os.clock() * 1000)
    
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local art = require("core.dashboard.art")
    
    -- Random art
    local cat_lines = art.get_random()
    
    dashboard.section.header.val = cat_lines
    
    dashboard.section.buttons.val = {
        dashboard.button("f", "🐟 Find File", ":Telescope find_files<CR>"),
        dashboard.button("n", "🐾 New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("q", "😿 Quit", ":qa<CR>"),
    }
    
    alpha.setup(dashboard.config)
end

return M
