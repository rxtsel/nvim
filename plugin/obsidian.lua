local add = require('vim-pack').add

local function is_dir(path)
    return vim.fn.isdirectory(path) == 1
end

local function ensure_dir(path)
    if not is_dir(path) then
        local ok = vim.fn.mkdir(path, 'p')
        if ok == 0 then
            vim.notify('[obsidian] failed to create directory: ' .. path, vim.log.levels.ERROR)
        end
    end
end

local home = vim.fn.expand '~'
local primary = home .. '/Documents/rxtsel-vault/'
local fallback = home .. '/Documents/obsidian-vault/'

local vault_path
if is_dir(primary) then
    vault_path = primary
else
    ensure_dir(home .. '/Documents')
    ensure_dir(fallback)
    vault_path = fallback
end

add {
    {
        src = 'obsidian-nvim/obsidian.nvim',
        opts = {
            workspaces = {
                { name = 'rxtsel-vault', path = vault_path },
            },
            templates = {
                folder = '_templates',
                date_format = '%Y-%m-%d-%a',
                time_format = '%H:%M',
            },
            daily_notes = {
                folder = 'daily',
                date_format = '%Y-%m-%d-%A',
            },
            completion = {
                min_chars = 2,
            },
            picker = {
                name = 'mini.pick',
            },
            attachments = {
                folder = './uploads',
                img_name_func = function()
                    return string.format('upload-%s', os.date '%Y%m%d%H%M%S')
                end,
                confirm_img_paste = true,
            },
            legacy_commands = false,
            checkbox = {
                order = { ' ', 'x' },
            },
            footer = {
                enabled = false,
            },
        },
        on_setup = function()
            local function map(lhs, rhs, desc)
                vim.keymap.set('n', lhs, rhs, { desc = desc })
            end

            map('<leader>on', '<cmd>Obsidian new<CR>', 'New note')
            map('<leader>on', '<cmd>Obsidian new_from_template<CR>', 'New note with template')
            map('<leader>ot', '<cmd>Obsidian today<CR>', "Today's note")
            map('<leader>ob', '<cmd>Obsidian backlinks<CR>', 'Backlinks')
            map('<leader>ol', '<cmd>Obsidian links<CR>', 'Links')
            map('<leader>os', '<cmd>Obsidian search<CR>', 'Search vault')
            map('<leader>oq', '<cmd>Obsidian quick_switch<CR>', 'Quick switch')

            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'markdown',
                callback = function(ev)
                    local buf_path = vim.api.nvim_buf_get_name(ev.buf)
                    if not vim.startswith(buf_path, vault_path) then
                        return
                    end

                    local bufopts = { buffer = ev.buf }

                    vim.keymap.set('n', '<leader>og', function()
                        return require('obsidian').util.gf_passthrough()
                    end, vim.tbl_extend(
                        'force',
                        bufopts,
                        { noremap = false, expr = true, desc = 'Follow link' }
                    ))

                    vim.keymap.set('n', '<leader>oc', function()
                        return require('obsidian').util.toggle_checkbox()
                    end, vim.tbl_extend('force', bufopts, { desc = 'Toggle checkbox' }))

                    vim.keymap.set('n', '<CR>', function()
                        return require('obsidian').util.smart_action()
                    end, vim.tbl_extend('force', bufopts, { expr = true, desc = 'Smart action' }))
                end,
            })
        end,
    },
}
