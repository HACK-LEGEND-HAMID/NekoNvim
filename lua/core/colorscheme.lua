local M = {}

M.colors = {
    -- Backgrounds
    bg = "#0d0f18",
    bg_darker = "#090b12",
    bg_lighter = "#111122",
    
    -- Foreground
    fg = "#c8d3f5",
    fg_dark = "#444466",
    
    -- Dashboard
    header = "#ff007c",
    button = "#65bcff",
    shortcut = "#ff9663",
    footer = "#545c7e",
    
    -- Syntax
    string_color = "#c3e88d",
    keyword = "#c099ff",
    function_color = "#82aaff",
    comment = "#636da6",
    number = "#ffc777",
    
    -- Status
    error_color = "#ff5370",
    warning = "#ff9663",
    success = "#c3e88d",
    info = "#65bcff",
}

function M.setup()
    local c = M.colors

    -- ====== BASE UI ======
    vim.cmd("highlight Normal guibg=NONE guifg=" .. c.fg)
    vim.cmd("highlight NormalNC guibg=NONE guifg=" .. c.fg_dark)
    vim.cmd("highlight NonText guibg=NONE")
    
    -- Line numbers
    vim.cmd("highlight LineNr guibg=NONE guifg=" .. c.footer)
    vim.cmd("highlight CursorLineNr guibg=NONE guifg=" .. c.button .. " gui=bold")
    vim.cmd("highlight CursorLine guibg=" .. c.bg_darker)
    vim.cmd("highlight SignColumn guibg=NONE")
    
    -- Status bar
    vim.cmd("highlight StatusLine guibg=" .. c.bg_darker .. " guifg=" .. c.fg)
    vim.cmd("highlight StatusLineNC guibg=" .. c.bg_darker .. " guifg=" .. c.footer)
    
    -- Splits
    vim.cmd("highlight VertSplit guibg=NONE guifg=" .. c.bg_darker)
    vim.cmd("highlight WinSeparator guibg=NONE guifg=" .. c.bg_darker)

    -- ====== TABS ======
    vim.cmd("highlight TabLine guibg=" .. c.bg_darker .. " guifg=" .. c.footer)
    vim.cmd("highlight TabLineSel guibg=" .. c.bg .. " guifg=" .. c.fg .. " gui=bold")
    vim.cmd("highlight TabLineFill guibg=" .. c.bg_darker)

    -- ====== POPUP MENU (Autocomplete) ======
    vim.cmd("highlight Pmenu guibg=" .. c.bg_lighter .. " guifg=" .. c.fg)
    vim.cmd("highlight PmenuSel guibg=" .. c.button .. " guifg=" .. c.bg .. " gui=bold")
    vim.cmd("highlight PmenuSbar guibg=" .. c.bg_darker)
    vim.cmd("highlight PmenuThumb guibg=" .. c.footer)

    -- ====== FLOATING WINDOWS ======
    vim.cmd("highlight FloatBorder guifg=" .. c.footer)
    vim.cmd("highlight NormalFloat guibg=" .. c.bg_lighter .. " guifg=" .. c.fg)

    -- ====== SYNTAX ======
    vim.cmd("highlight String guifg=" .. c.string_color)
    vim.cmd("highlight Keyword guifg=" .. c.keyword .. " gui=bold")
    vim.cmd("highlight Function guifg=" .. c.function_color)
    vim.cmd("highlight Comment guifg=" .. c.comment .. " gui=italic")
    vim.cmd("highlight Number guifg=" .. c.number)
    vim.cmd("highlight Boolean guifg=" .. c.number)
    vim.cmd("highlight Type guifg=" .. c.keyword)
    vim.cmd("highlight Constant guifg=" .. c.number)
    vim.cmd("highlight Directory guifg=" .. c.button .. " gui=bold")

    -- ====== SEARCH & SELECTION ======
    vim.cmd("highlight Search guibg=" .. c.button .. " guifg=" .. c.bg .. " gui=bold")
    vim.cmd("highlight IncSearch guibg=" .. c.header .. " guifg=" .. c.bg .. " gui=bold")
    vim.cmd("highlight Visual guibg=" .. c.bg_lighter)
    vim.cmd("highlight VisualNOS guibg=" .. c.bg_lighter)

    -- ====== DIAGNOSTICS ======
    vim.cmd("highlight DiagnosticError guifg=" .. c.error_color)
    vim.cmd("highlight DiagnosticWarn guifg=" .. c.warning)
    vim.cmd("highlight DiagnosticInfo guifg=" .. c.info)
    vim.cmd("highlight DiagnosticHint guifg=" .. c.footer)
    vim.cmd("highlight DiagnosticUnderlineError guisp=" .. c.error_color .. " gui=undercurl")
    vim.cmd("highlight DiagnosticUnderlineWarn guisp=" .. c.warning .. " gui=undercurl")

    -- ====== MISC ======
    vim.cmd("highlight MatchParen guibg=" .. c.bg_lighter .. " guifg=" .. c.header .. " gui=bold")
    vim.cmd("highlight Folded guibg=" .. c.bg_darker .. " guifg=" .. c.comment)
    vim.cmd("highlight Conceal guibg=NONE guifg=" .. c.footer)
    vim.cmd("highlight ErrorMsg guifg=" .. c.error_color .. " gui=bold")
    vim.cmd("highlight WarningMsg guifg=" .. c.warning)
    vim.cmd("highlight Question guifg=" .. c.info .. " gui=bold")
    vim.cmd("highlight Title guifg=" .. c.header .. " gui=bold")
    vim.cmd("highlight SpecialKey guifg=" .. c.footer)
end

return M
