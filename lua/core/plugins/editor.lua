
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

}
