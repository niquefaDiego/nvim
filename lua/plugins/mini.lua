return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function()
            require('mini.icons').setup()
            require('mini.statusline').setup()
            require('mini.files').setup()
            require('mini.cursorword').setup()
            require('mini.tabline').setup()
            require('mini.jump2d').setup()
            require('mini.completion').setup()
            require('mini.sessions').setup()
            require('mini.visits').setup()
            require('mini.splitjoin').setup()
        end
    }
}
