return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.startify")

        local animate = require("animations.animate")
        local animation = require("animations.robots")
        local parse_txt = require("animations.parse-txt-to-frames")

        local frames = parse_txt("./lua/movies/star-wars-iv.txt")

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
        animate(dashboard, alpha, frames)
        alpha.setup(dashboard.config)
    end,
}
