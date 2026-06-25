local add = require('vim-pack').add

add {
    {
        src = 'craftzdog/solarized-osaka.nvim',
        setup = false,
        on_setup = function()
            vim.cmd.colorscheme 'solarized-osaka'

            -- Change color to fold icons
            vim.api.nvim_set_hl(0, 'FoldColumn', {
                link = 'Comment',
            })
        end,
    },
}
