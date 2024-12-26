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

		local frames = parse_txt("./lua/movies/star-wars-iv.txt")
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
