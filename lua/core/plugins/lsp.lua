return {
    -- Mason: LSP Server Manager
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },

    -- Mason-LSPConfig Bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",         -- Lua
                    "pyright",        -- Python
                    "clangd",         -- C/C++
                    "rust_analyzer",  -- Rust
                    "dartls",         -- Dart
                    "jdtls",          -- Java
                    "omnisharp",      -- C#
                    "ts_ls",          -- JavaScript
                    "html",           -- HTML
                    "cssls",          -- CSS
                    "jsonls",         -- JSON
                    "yamlls",         -- YAML
                    "bashls",         -- Bash
                },
                automatic_installation = true,
            })
        end,
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({})

            -- C/C++
            lspconfig.clangd.setup({})

            -- Rust
            lspconfig.rust_analyzer.setup({})

            -- Dart
            lspconfig.dartls.setup({})

            -- Java
            lspconfig.jdtls.setup({})

            -- C#
            lspconfig.omnisharp.setup({})

            -- JavaScript/TypeScript
            lspconfig.ts_ls.setup({})

            -- HTML
            lspconfig.html.setup({})

            -- CSS
            lspconfig.cssls.setup({})

            -- JSON
            lspconfig.jsonls.setup({})

            -- YAML
            lspconfig.yamlls.setup({})

            -- Bash
            lspconfig.bashls.setup({})
        end,
    },
}
