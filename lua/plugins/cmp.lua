return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        'L3MON4D3/LuaSnip', version = 'v2.*'
    },
    opts = {
        sources = {
            default = { "lsp", "path", "buffer", "snippets" },
        },
        snippets = { preset = 'luasnip' },
        keymap = {
            preset = 'none',

            ['<Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                'snippet_forward',
                'fallback'
            },

            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
        }
    }
}
