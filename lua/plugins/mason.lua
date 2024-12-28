return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"csharp_ls",
				"rust_analyzer",
				"svelte",
			},
		})

		local lspconfig = require("lspconfig")

		-- Lua language server configuration
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		lspconfig.ts_ls.setup({})
		lspconfig.csharp_ls.setup({})
		lspconfig.rust_analyzer.setup({
			settings = {
				diagnostics = true,
			},
		})
		lspconfig.svelte.setup({})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
