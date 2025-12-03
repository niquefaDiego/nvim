vim.treesitter.start()

vim.api.nvim_create_user_command(
    "Wf",
    function()
        vim.cmd("w")
        vim.cmd("!cargo check")
    end,
    { nargs = 0 }
);

vim.api.nvim_create_user_command(
    "Wr",
    function()
        vim.cmd("w")
        vim.cmd("!cargo run")
    end,
    { nargs = 0 }
);

