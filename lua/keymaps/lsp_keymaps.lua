local M = {}

M.on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set

    -- LSP-specific key mappings
    keymap("n", "gd", vim.lsp.buf.definition, opts)        -- Go to definition
    keymap("n", "K", vim.lsp.buf.hover, opts)             -- Show hover info
    keymap("n", "gi", vim.lsp.buf.implementation, opts)   -- Go to implementation
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)   -- Rename symbol
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
    keymap("n", "gr", vim.lsp.buf.references, opts)       -- List references
    keymap("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
    end, opts)                                            -- Format file
end

return M

