local add = require('vim-pack').add

add({
    {
        src = 'craftzdog/solarized-osaka.nvim',
        setup = false,
        on_setup = function()
            vim.cmd.colorscheme('solarized-osaka')
        end,
    },
})
