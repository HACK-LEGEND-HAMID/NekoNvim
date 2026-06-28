return {
    -- Autocomplete Engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",   -- LSP suggestions
            "hrsh7th/cmp-buffer",     -- File words
            "hrsh7th/cmp-path",       -- File paths
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                -- Keyboard shortcuts
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

                -- Suggestion sources
                sources = {
                    { name = "nvim_lsp" },   -- Functions, variables
                    { name = "buffer" },      -- Words in file
                    { name = "path" },        -- File paths like ./
                },
            })
        end,
    },

    -- LSP completion source (required)
    { "hrsh7th/cmp-nvim-lsp" },
}
