local map = vim.keymap.set

-- Leader
vim.g.mapleader = " " 

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
