local add_on_event = require('vim-pack').add_on_event

add_on_event({ 'BufReadPre', 'BufNewFile' }, {
    {
        src = 'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = buffer,
                        desc = desc,
                        silent = true,
                    })
                end

                map('n', ']h', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gs.nav_hunk 'next'
                    end
                end, 'Next Hunk')

                map('n', '[h', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gs.nav_hunk 'prev'
                    end
                end, 'Prev Hunk')

                map('n', ']H', function()
                    gs.nav_hunk 'last'
                end, 'Last Hunk')

                map('n', '[H', function()
                    gs.nav_hunk 'first'
                end, 'First Hunk')

                map({ 'n', 'x' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
                map({ 'n', 'x' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')

                map('n', '<leader>gS', gs.stage_buffer, 'Stage Buffer')
                map('n', '<leader>gu', gs.undo_stage_hunk, 'Undo Stage Hunk')
                map('n', '<leader>gR', gs.reset_buffer, 'Reset Buffer')
                map('n', '<leader>gp', gs.preview_hunk_inline, 'Preview Hunk Inline')

                map('n', '<leader>gb', function()
                    gs.blame_line { full = true }
                end, 'Blame Line')

                map('n', '<leader>gB', function()
                    gs.blame()
                end, 'Blame Buffer')

                map('n', '<leader>gd', gs.diffthis, 'Diff This')

                map('n', '<leader>gD', function()
                    gs.diffthis '~'
                end, 'Diff This ~')

                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
            end,
        },
    },
})
