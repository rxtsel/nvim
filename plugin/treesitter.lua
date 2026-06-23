local add = require('vim-pack').add

add({
    {
        src = 'nvim-treesitter/nvim-treesitter',
        on_setup = function()
            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
    {
        src = 'nvim-treesitter/nvim-treesitter-context',
        module_name = 'treesitter-context',
        opts = {
            max_lines = 3,
            multiline_threshold = 1,
            min_window_height = 20,
        },
    },
})
