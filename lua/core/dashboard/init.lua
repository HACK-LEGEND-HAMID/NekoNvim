local M = {}

function M.setup()
    local ok, starter = pcall(require, "mini.starter")
    if not ok then
        vim.notify("mini.starter not installed", vim.log.levels.WARN)
        return
    end

    -- Load colorscheme
    local colors = require("core.colorscheme").colors

    math.randomseed(os.time() * os.clock())

    local art = require("core.dashboard.art")
    local cat_lines = art.get_random()

    starter.setup({
        autoopen = true,

        header = table.concat(cat_lines, "\n"),

        items = {
            { name = "🌙 Find File",     action = "Telescope find_files",        section = "Navigate" },
            { name = "🌙 New File",      action = "ene | startinsert",           section = "Navigate" },
            { name = "🌙 Recent Files",  action = "Telescope oldfiles",          section = "Navigate" },
            { name = "🌙 Search Text",   action = "Telescope live_grep",         section = "Navigate" },
            { name = "🌙 Config",        action = "e ~/.config/nvim/init.lua",   section = "Setup" },
            { name = "🌙 Quit",          action = "qa",                          section = "Setup" },
        },

        footer = "🐱 Trust no one, not even yourself Happy Hacking 🔴\n",

        content_hooks = {
            starter.gen_hook.adding_bullet("  ", false),
            starter.gen_hook.indexing("all", { "1", "2", "3", "4", "5", "6" }),
            starter.gen_hook.aligning("center", "center"),
            starter.gen_hook.padding(3),
        },
    })

    -- Apply colors from colorscheme
    vim.cmd(("highlight MiniStarterHeader guifg=%s gui=bold,italic"):format(colors.header))
    vim.cmd(("highlight MiniStarterSection guifg=%s gui=bold"):format(colors.shortcut))
    vim.cmd(("highlight MiniStarterItem guifg=%s gui=bold"):format(colors.button))
    vim.cmd(("highlight MiniStarterItemPrefix guifg=%s gui=bold"):format(colors.function_color))
    vim.cmd(("highlight MiniStarterFooter guifg=%s gui=italic"):format(colors.footer))
    vim.cmd(("highlight MiniStarterQuery guifg=%s gui=bold"):format(colors.number))
end


return M
