local add = require('vim-pack').add

add {
    { src = 'saghen/blink.lib', setup = false },
    {
        src = 'saghen/blink.cmp',
        opts = {
            fuzzy = { implementation = 'prefer_rust' },
            signature = { enabled = true },
            snippets = { preset = 'default' },
            cmdline = { enabled = false },
            completion = {
                keyword = { range = 'full' },
                accept = { auto_brackets = { enabled = false } },
                list = {
                    selection = { preselect = false, auto_insert = true },
                    max_items = 10,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                ghost_text = { enabled = true },
                menu = {
                    auto_show = true,
                    scrollbar = false,
                    draw = {
                        gap = 2,
                        columns = {
                            { 'kind_icon', 'kind', gap = 1 },
                            { 'label', 'label_description', gap = 1 },
                        },
                    },
                },
            },

            keymap = {
                ['<CR>'] = { 'accept', 'fallback' },
                ['<C-e>'] = { 'hide' },
                ['<C-n>'] = { 'select_next', 'show' },
                ['<C-p>'] = { 'select_prev' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-l>'] = { 'snippet_forward', 'fallback' },
                ['<C-h>'] = { 'snippet_backward', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            appearance = {
                nerd_font_variant = 'normal',
            },
        },
        on_setup = function()
            require('blink.cmp').build():pwait()
        end,
    },
}
