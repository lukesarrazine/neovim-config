local theme_priority = 1000
local current_colorscheme_index = 1
local default_colorscheme = "bamboo"
local colorschemes = { default_colorscheme, "rose-pine", "nightfox" }

local function cycle_colorscheme()
	current_colorscheme_index = current_colorscheme_index + 1
	if current_colorscheme_index > #colorschemes then
		current_colorscheme_index = 1
	end

	local colorscheme = colorschemes[current_colorscheme_index]
	local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if success then
		print("Switched to " .. colorscheme .. " colorscheme")
	else
		print("Failed to switch to " .. colorscheme .. " colorscheme")
	end
end

return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = theme_priority,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = theme_priority,
		config = function()
			require("bamboo").setup({})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = theme_priority + 1, -- run this last
		config = function()
			-- Automatically set colorscheme based on OS
			local is_windows = vim.loop.os_uname().sysname:match("Windows")
			if is_windows then
				vim.cmd("colorscheme rose-pine")
			else
				vim.cmd("colorscheme " .. default_colorscheme)
			end

			vim.keymap.set("n", "<leader>cc", cycle_colorscheme, { desc = "Cycle through colorschemes" })
		end,
	},
}
