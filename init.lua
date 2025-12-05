----- VIM settings -----

-- set <space> as the leader key (See `:help mapleader`)
vim.g.mapleader = ' '
vim.g.maplocalleader = '//'

-- show line number
vim.o.number = true

-- show tab ('\t') as 4 spaces
vim.o.tabstop = 4

-- insert/remove 4 spaces when using the shift operations (>> or <<)
vim.o.shiftwidth = 4

-- replace tab with spaces
vim.o.expandtab = true

-- show relative number to cursor's line, instead of line number
vim.o.relativenumber = false -- I tried relative numbers and didn't like it :'v

-- highlight the cursor's line
vim.o.cursorline = true

-- do not show mode ("-- INSERT --" at the bottom)
vim.o.showmode = false

-- keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- share clipboard with OS
-- Not using it because it might break Ctrl-v (block mode for multi-line edits)
-- vim.o.clipboard = "unnamedplus"

-- idle ms for saving file to disk for crash-recovery, default is 4000
vim.o.updatetime = 888

-- mapped sequence wait time in ms (default is 1000)
vim.o.timeoutlen = 300

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- minimum number of lines to keep below or above the cursor
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- see `:help 'confirm'`
vim.o.confirm = true

-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = {
        source = 'if_many',
        spacing = 2,
    },
}

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Open full diagnostic message" })

require("config.lazy")

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')

-- lsp mappings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })

-- open working directory with mini.files
vim.keymap.set("n", "<leader>od", function()
    vim.cmd[[lua MiniFiles.open()]]
end, { silent = true })

vim.cmd[[colorscheme tokyonight]]
