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
            preset = 'default',

            ['<Tab>'] = { 'select_and_accept' },

            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
        }
    }
}
