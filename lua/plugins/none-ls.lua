return {
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "csharpier", "prettier" },
				automatic_installation = true,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
				},
			})

			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

			-- Auto format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*", -- Use "*" for all file types or specify file types like "*.lua"
				callback = function()
					vim.lsp.buf.format({ async = false }) -- Synchronous formatting before saving
				end,
			})
		end,
	},
}
