return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "csharp_ls"
            }
        }

        -- Import Key Mappings
        local lsp_keymaps = require("keymaps.lsp_keymaps")

        -- LSPConfig setup
        local lspconfig = require("lspconfig")

        -- Lua language server configuration
        lspconfig.lua_ls.setup {
            on_attach = lsp_keymaps.on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Recognize `vim` as a global variable
                    },
                },
            },
        }

        -- C# language server configuration
        lspconfig.csharp_ls.setup {
            on_attach = lsp_keymaps.on_attach
        }
    end,
}

