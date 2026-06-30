return {
    -- Dashboard
    {
        "echasnovski/mini.starter",
        version = "*",
        config = function()
            require("core.dashboard").setup()
        end,
    },

    -- Vibrant Cosmic Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPost",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- ============================================
            -- VIBRANT COLORS
            -- ============================================
            local colors = {
                BG       = '#0a0b13',
                FG       = '#e2e8f0',
                DARKBLUE = '#4facfe',
                VIOLET   = '#a855f7',
                RED      = '#f43f5e',
                CYAN     = '#22d3ee',
                ORANGE   = '#fb923c',
                MAGENTA  = '#e879f9',
                BLUE     = '#60a5fa',
                YELLOW   = '#fbbf24',
                GREEN    = '#34d399',
                PINK     = '#f472b6',
                TEAL     = '#2dd4bf',
                PURPLE   = '#c084fc',
                SUNSET   = '#f97316',
                OCEAN    = '#38bdf8',
            }

            -- ============================================
            -- OS DETECTION
            -- ============================================
            local function get_os_name()
                local os_name = vim.loop.os_uname().sysname
                if os_name == "Linux" then
                    if vim.fn.getenv("TERMUX_VERSION") ~= vim.NIL then
                        return " Termux"
                    else
                        return " Linux"
                    end
                elseif os_name == "Darwin" then
                    return " macOS"
                elseif os_name == "Windows_NT" then
                    return " Windows"
                else
                    return " " .. os_name
                end
            end

            -- ============================================
            -- ICON SETS
            -- ============================================
            math.randomseed(os.time())
            local icon_sets = {
                geometry  = { '★', '☆', '✧', '✦', '✶', '✷', '✸', '✹', '⬡', '⏣', '⬢', '◆', '◇', '◈', '⬖', '⬗' },
                moon      = { '☽', '☾', '⚝', '◐', '◑', '◒', '◓' },
                spiritual = { '✦', '✧', '⋆', '˚', '✴', '✳', '✲', '✵', '✶', '✷', '✸', '✹', '➳', '➵', '➴', '➶' },
                minimal   = { '·', '⋅', '⋄', '∘', '∙', '⋅', '⋆', '⌑', '⌒', '△', '▽', '◁', '▷', '○', '◯', '⬤' },
                nerdfont  = { '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '' },
            }

            local function get_random_icon(icons)
                return icons[math.random(#icons)]
            end

            local function get_random_vibrant_color()
                local c = { colors.PINK, colors.CYAN, colors.YELLOW, colors.ORANGE, colors.GREEN, colors.TEAL, colors.MAGENTA, colors.BLUE, colors.PURPLE }
                return c[math.random(#c)]
            end

            -- ============================================
            -- MODE FUNCTIONS
            -- ============================================
            local function get_mode_color()
                local mc = {
                    n = colors.DARKBLUE,
                    i = colors.VIOLET,
                    v = colors.RED,
                    [''] = colors.BLUE,
                    V = colors.PINK,
                    c = colors.MAGENTA,
                    no = colors.RED,
                    s = colors.ORANGE,
                    S = colors.SUNSET,
                    ic = colors.YELLOW,
                    R = colors.TEAL,
                    Rv = colors.OCEAN,
                    cv = colors.RED,
                    ce = colors.RED,
                    r = colors.CYAN,
                    rm = colors.CYAN,
                    ['r?'] = colors.PURPLE,
                    ['!'] = colors.RED,
                    t = colors.GREEN,
                }
                return mc[vim.fn.mode()] or colors.FG
            end

            local function get_opposite_color(mc)
                local opp = {
                    [colors.RED] = colors.CYAN,
                    [colors.BLUE] = colors.ORANGE,
                    [colors.GREEN] = colors.MAGENTA,
                    [colors.MAGENTA] = colors.DARKBLUE,
                    [colors.ORANGE] = colors.BLUE,
                    [colors.CYAN] = colors.YELLOW,
                    [colors.VIOLET] = colors.GREEN,
                    [colors.YELLOW] = colors.RED,
                    [colors.DARKBLUE] = colors.VIOLET,
                    [colors.PINK] = colors.TEAL,
                    [colors.TEAL] = colors.PINK,
                    [colors.PURPLE] = colors.YELLOW,
                    [colors.SUNSET] = colors.OCEAN,
                    [colors.OCEAN] = colors.SUNSET,
                }
                return opp[mc] or colors.FG
            end

            local function mode()
                local map = {
                    n = 'N', i = 'I', v = 'V', [''] = 'V', V = 'V',
                    c = 'C', no = 'N', s = 'S', S = 'S', ic = 'I',
                    R = 'R', Rv = 'R', cv = 'C', ce = 'C', r = 'R',
                    rm = 'M', ['r?'] = '?', ['!'] = '!', t = 'T',
                }
                return map[vim.fn.mode()] or '?'
            end

            -- ============================================
            -- CONFIG
            -- ============================================
            local config = {
                options = {
                    component_separators = '',
                    section_separators = '',
                    theme = {
                        normal   = { c = { fg = colors.FG, bg = colors.BG } },
                        inactive = { c = { fg = colors.FG, bg = colors.BG } },
                    },
                    disabled_filetypes = { 'neo-tree', 'undotree', 'sagaoutline', 'diff' },
                },
                sections = {
                    lualine_a = {}, lualine_b = {}, lualine_c = {},
                    lualine_x = {}, lualine_y = {}, lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {}, lualine_b = {},
                    lualine_c = { { 'location', color = function() return { fg = colors.FG, gui = 'bold' } end } },
                    lualine_x = { { 'filename', color = function() return { fg = colors.FG, gui = 'bold,italic' } end } },
                    lualine_y = {}, lualine_z = {},
                },
            }

            local function ins_left(c) table.insert(config.sections.lualine_c, c) end
            local function ins_right(c) table.insert(config.sections.lualine_x, c) end

            -- ============================================
            -- LEFT SECTION
            -- ============================================
            ins_left {
                mode,
                color = function() return { fg = colors.BG, bg = get_mode_color(), gui = 'bold' } end,
                padding = { left = 1, right = 1 },
            }
            ins_left {
                function() return '' end,
                color = function() return { fg = get_mode_color() } end,
                padding = { left = 0 },
            }
            ins_left {
                get_os_name,
                color = function() return { fg = get_mode_color(), gui = 'bold' } end,
            }
            ins_left {
                function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
                icon = ' ',
                color = function() return { fg = get_mode_color(), gui = 'bold' } end,
            }
            ins_left {
                function() return '' end,
                color = function() return { fg = get_opposite_color(get_mode_color()) } end,
                padding = { left = 0 },
            }
            ins_left {
                'filename',
                color = function() return { fg = colors.BG, bg = get_opposite_color(get_mode_color()), gui = 'bold' } end,
            }
            ins_left {
                function() return '' end,
                color = function() return { fg = get_opposite_color(get_mode_color()) } end,
                padding = { left = 0 },
            }

            for _, icons in pairs(icon_sets) do
                ins_left {
                    function() return get_random_icon(icons) end,
                    color = function() return { fg = get_random_vibrant_color(), gui = 'bold' } end,
                }
            end

            ins_left {
                function()
                    local gs = vim.b.gitsigns_status_dict
                    if gs then
                        return string.format('+%d ~%d -%d', gs.added or 0, gs.changed or 0, gs.removed or 0)
                    end
                    return ''
                end,
                color = { fg = colors.YELLOW, gui = 'bold' },
            }

            -- ============================================
            -- RIGHT SECTION
            -- ============================================
            ins_right {
                function()
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_clients()
                    if next(clients) == nil then return 'LSP' end
                    local short = {
                        pyright = 'py', tsserver = 'ts', rust_analyzer = 'rs',
                        lua_ls = 'lua', clangd = 'c++', bashls = 'sh',
                        jsonls = 'json', html = 'html', cssls = 'css', yamlls = 'yml',
                    }
                    for _, client in ipairs(clients) do
                        local fts = client.config.filetypes
                        if fts and vim.fn.index(fts, buf_ft) ~= -1 then
                            return short[client.name] or client.name:sub(1, 2)
                        end
                    end
                    return 'LSP'
                end,
                icon = ' ',
                color = { fg = colors.YELLOW, gui = 'bold' },
            }

            for _, icons in pairs(icon_sets) do
                ins_right {
                    function() return get_random_icon(icons) end,
                    color = function() return { fg = get_random_vibrant_color(), gui = 'bold' } end,
                }
            end

            ins_right {
                function() return '' end,
                color = function() return { fg = get_mode_color() } end,
                padding = { left = 0 },
            }
            ins_right {
                'location',
                color = function() return { fg = colors.BG, bg = get_mode_color(), gui = 'bold' } end,
            }
            ins_right {
                function() return '' end,
                color = function() return { fg = get_mode_color() } end,
                padding = { left = 0 },
            }
            ins_right {
                'branch',
                icon = ' ',
                color = function() return { fg = get_mode_color(), gui = 'bold' } end,
            }
            ins_right {
                function() return '' end,
                color = function() return { fg = get_mode_color() } end,
                padding = { left = 0 },
            }
            ins_right {
                'progress',
                color = function() return { fg = colors.BG, bg = get_mode_color(), gui = 'bold' } end,
            }

            require("lualine").setup(config)
        end,
    },
}
