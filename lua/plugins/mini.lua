return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function()
            require('mini.icons').setup()
            require('mini.statusline').setup()
            require('mini.files').setup()
            require('mini.animate').setup()
            require('mini.cursorword').setup()
            require('mini.tabline').setup()
        end
    }
}
