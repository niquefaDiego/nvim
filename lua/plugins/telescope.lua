return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            local builtin = require("telescope.builtin")
            -- find in working directory
            vim.keymap.set("n", "<leader>fd", builtin.find_files)

            -- edit neovim config
            vim.keymap.set(
                "n",
                "<leader>en",
                function()
                    builtin.find_files {
                        cwd = vim.fn.stdpath("config")
                    }
                end
            )

            -- find help
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        end
    }
}
