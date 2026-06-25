local M = {}

function M.load()
    require("core.options")
    require("core.keymaps")
    require("core.plugins")
    require("core.dashboard").setup()
end

return M
