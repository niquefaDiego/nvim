return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            require("telescope").setup {
                extensions = { fzf = {} }
            }
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
            -- edit neovim package
            vim.keymap.set(
                "n",
                "<leader>ep",
                function()
                    builtin.find_files {
                        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
                    }
                end
            )

            -- find help
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        end
    }
}
