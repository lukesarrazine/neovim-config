return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local animate = require("animations.animate")
		local animation = require("animations.robots")
		local parse_txt = require("animations.parse-txt-to-frames")

		local config_dir = vim.fn.stdpath("config")
		local file_path = config_dir .. "/lua/movies/star-wars-iv.txt"

		local frames = parse_txt(file_path)
		math.randomseed(os.time()) -- Seed the random number generator with the current time
		local start_frame = math.random(1, #frames)

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		-- Start the animation
		animate(dashboard, alpha, frames, start_frame)
		alpha.setup(dashboard.config)
	end,
}
