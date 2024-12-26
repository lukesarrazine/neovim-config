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

        print("Current working directory:", os.getenv("PWD") or io.popen("pwd"):read("*l"))
        parse_txt("./lua/movies/star-wars-iv.txt", "./lua/movies/star-wars-iv.lua")

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
        animate(dashboard, alpha, animation)
        alpha.setup(dashboard.config)
    end,
}
