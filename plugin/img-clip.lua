local add_on_file_type = require('vim-pack').add_on_file_type

add_on_file_type({ 'markdown' }, {
    {
        src = 'HakonHarnes/img-clip.nvim',
        opts = {
            default = {
                relative_to_current_file = true,
                dir_path = function()
                    return vim.fn.expand '%:t:r' .. '-img'
                end,
                prompt_for_file_name = false,
                file_name = '%y%m%d-%H%M%S',
                extension = 'avif',
                process_cmd = 'convert - -quality 75 avif:-',
            },
        },
        on_setup = function()
            vim.keymap.set('n', '<leader>ci', '<cmd>PasteImage<cr>', { desc = 'Paste image from system clipboard' })
        end,
    },
})
