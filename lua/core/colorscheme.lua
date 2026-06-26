local M = {}

M.colors = {
    -- UI Colors
    bg_darker = "#090b12",
    fg = "#c8d3f5",
    
    -- Dashboard/Startup
    header = "#ff007c",        -- Header
    button = "#65bcff",        -- Menu items
    shortcut = "#ff9663",      -- Section headers
    footer = "#545c7e",        -- Footer
    
    -- Syntax Highlighting
    string_color = "#c3e88d",
    keyword = "#c099ff",
    function_color = "#82aaff",
    comment = "#636da6",
    number = "#ffc777",
    
    -- Status/Alerts
    error_color = "#ff5370",
    warning = "#ff9663",       -- Same as shortcut for consistency
    success = "#c3e88d",       -- Same as string for consistency
    info = "#65bcff",          -- Same as button for consistency
}

function M.setup()
    local c = M.colors

    -- UI Elements
    vim.cmd("highlight Normal guibg=NONE guifg=" .. c.fg)
    vim.cmd("highlight NonText guibg=NONE")
    vim.cmd("highlight CursorLine guibg=" .. c.bg_darker)
    vim.cmd("highlight LineNr guibg=NONE guifg=" .. c.footer)
    vim.cmd("highlight SignColumn guibg=NONE")
    vim.cmd("highlight StatusLine guibg=" .. c.bg_darker .. " guifg=" .. c.fg)
    vim.cmd("highlight VertSplit guibg=NONE guifg=" .. c.footer)

    -- Syntax Highlighting
    vim.cmd("highlight String guifg=" .. c.string_color)
    vim.cmd("highlight Keyword guifg=" .. c.keyword .. " gui=bold")
    vim.cmd("highlight Function guifg=" .. c.function_color)
    vim.cmd("highlight Comment guifg=" .. c.comment .. " gui=italic")
    vim.cmd("highlight Number guifg=" .. c.number)

    -- Search & Selection
    vim.cmd("highlight Search guibg=" .. c.bg_darker .. " guifg=" .. c.header .. " gui=bold")
    vim.cmd("highlight Visual guibg=" .. c.bg_darker .. " guifg=" .. c.button)

    -- Diagnostics
    vim.cmd("highlight DiagnosticError guifg=" .. c.error_color)
    vim.cmd("highlight DiagnosticWarn guifg=" .. c.warning)
    vim.cmd("highlight DiagnosticInfo guifg=" .. c.info)
end

return M
