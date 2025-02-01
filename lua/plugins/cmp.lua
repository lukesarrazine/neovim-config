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
    }
}
