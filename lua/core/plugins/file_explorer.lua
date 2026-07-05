return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<C-f>", ":Neotree toggle dir=~<CR>", desc = "Toggle Explorer" },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 30,
                    mappings = { ["<C-f>"] = "close_window" },
                },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
                sources = { "filesystem", "buffers", "git_status" },
                close_if_last_window = true,
                default_component_configs = {
                    icon = {
                        folder_closed = "📁",
                        folder_open = "📂",
                        folder_empty = "📁",
                        default = "📄",
                        lua = "🌙",
                        python = "🐍",
                        javascript = "📜",
                        typescript = "📘",
                        html = "🌐",
                        css = "🎨",
                        json = "📋",
                        yaml = "⚙️",
                        md = "📝",
                        txt = "📃",
                        c = "⚡",
                        cpp = "⚡",
                        rust = "🦀",
                        go = "🐹",
                        java = "☕",
                        sh = "💻",
                        bash = "💻",
                        zsh = "💻",
                    },
                    git_status = {
                        symbols = {
                            added = "+",
                            modified = "~",
                            deleted = "-",
                            renamed = ">",
                            untracked = "?",
                            ignored = ".",
                            unstaged = "!",
                            staged = "✓",
                            conflict = "⚠",
                        },
                    },
                },
            })
        end,
    },

    {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        require("telescope").setup({})
    end,
},
}
