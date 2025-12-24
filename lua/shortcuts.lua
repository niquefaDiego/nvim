-- My own mini-plugin to quickly access my common projects when I open neovim.

SHORTCUTS_FOLDER = "C:\\Shortcuts"
SHORTCUTS_GROUP = vim.api.nvim_create_augroup("Shortcuts", { clear = true })
SHORTCUTS_CHANGE_DIR_ON_SYMLINK = false

vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Change directory to shortcuts folder when nvim opens on default location",
    group = SHORTCUTS_GROUP,
    callback = function()
        local cwd = vim.fn.getcwd()
        local nvim_exec_path = vim.fn.exepath("nvim")
        local nvim_exec_folder = vim.fn.fnamemodify(nvim_exec_path, ":p:h")
        if cwd == nvim_exec_folder then
            SHORTCUTS_CHANGE_DIR_ON_SYMLINK = true
            print("Entered VIM from default location, going to shortcuts!")
            vim.api.nvim_set_current_dir(SHORTCUTS_FOLDER)
            local builtin = require("telescope.builtin")
            builtin.find_files({
                cwd = SHORTCUTS_FOLDER,
                previewer = false,
                follow = true
            })
        end
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Change working directory when following a symlink from a folder named \"Shortcuts\"",
    group = SHORTCUTS_GROUP,
    callback = function()
        if not SHORTCUTS_CHANGE_DIR_ON_SYMLINK then return end
        local buffer_name = vim.api.nvim_buf_get_name(0)
        if buffer_name ~= "" then
            SHORTCUTS_CHANGE_DIR_ON_SYMLINK = false
            local new_dir = buffer_name
            if vim.fn.isdirectory(new_dir) ~= 1 then
                new_dir = vim.fn.fnamemodify(new_dir, ":h")
            end
            print("Changing working directory to \"" .. new_dir .. "\"")
            vim.fn.chdir(new_dir)
        end
    end,
})
