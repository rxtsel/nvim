local add_on_file_type = require('vim-pack').add_on_file_type

add_on_file_type('markdown', {
    {
        src = '3rd/image.nvim',
        opts = {
            integrations = {
                markdown = {
                    clear_in_insert_mode = true,
                    only_render_image_at_cursor = true,
                    only_render_image_at_cursor_mode = 'inline',
                },
            },
        },
    },
})
