local add_on_file_type = require('vim-pack').add_on_file_type

add_on_file_type({ 'http', 'rest' }, {
    {
        src = 'mistweaverco/kulala.nvim',
        opts = {
            global_keymaps = false,
            global_keymaps_prefix = '<leader>R',
            kulala_keymaps_prefix = '',
        },
        on_setup = function()
            vim.keymap.set('n', '<leader>s', function()
                require('kulala').run()
            end, { desc = 'Send request' })
        end,
    },
})
