return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function()
            require('mini.statusline').setup({ use_icons = true })
            require('mini.files').setup()
        end
    }
}
