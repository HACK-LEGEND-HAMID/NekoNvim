
return {

    -- Auto close brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Surround words
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },

    -- Visual undo tree
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", ":UndotreeToggle<CR>", desc = "Undo Tree" },
        },
    },

    -- Zen mode
    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>z", ":ZenMode<CR>", desc = "Zen Mode" },
        },
        config = true,
    },
    -- leap
{
    url = "https://codeberg.org/andyg/leap.nvim",
    keys = {
        { "s", mode = { "n", "x", "o" }, desc = "Leap forward" },
        { "S", mode = { "n", "x", "o" }, desc = "Leap backward" },
    },
    config = function()
        -- Only set s/S, don't touch p/P
        vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
        vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    end,
},

}

