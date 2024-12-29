return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        require("ext-dependencies.ripgrep").ensure_ripgrep()

        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        -- Telescope setup (optional)
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                    },
                },
                file_ignore_patterns = {
                    "target/",
                    "bin/",
                    "obj/",
                    "node_modules/",
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        telescope.load_extension("ui-select")

        -- Key mappings
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
    end,
}
