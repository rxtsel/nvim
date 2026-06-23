local add = require('vim-pack').add
local add_on_event = require('vim-pack').add_on_event

-- Core editing experience.
add {
    {
        src = 'nvim-mini/mini.pairs',
    },

    {
        src = 'nvim-mini/mini.icons',
    },

    {
        src = 'nvim-mini/mini.pick',
    },

    {
        src = 'nvim-mini/mini.surround',
        opts = {
            mappings = {
                add = 'gsa',
                delete = 'gsd',
                find = 'gsf',
                find_left = 'gsF',
                highlight = 'gsh',
                replace = 'gsr',
                suffix_last = 'l',
                suffix_next = 'n',
            },
        },
    },
}

-- File explorer.
local function map_split(buf_id, lhs, direction)
    local minifiles = require 'mini.files'

    local function rhs()
        local window = minifiles.get_explorer_state().target_window

        if window == nil or minifiles.get_fs_entry().fs_type == 'directory' then
            return
        end

        local new_target_window

        vim.api.nvim_win_call(window, function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
        end)

        minifiles.set_target_window(new_target_window)
        minifiles.go_in { close_on_file = true }
    end

    vim.keymap.set('n', lhs, rhs, {
        buffer = buf_id,
        desc = 'Split ' .. string.sub(direction, 12),
    })
end

add {
    {
        src = 'nvim-mini/mini.files',

        opts = {
            mappings = {
                show_help = '?',
                go_in_plus = '<cr>',
                go_out_plus = '<tab>',
            },

            content = {
                filter = function(entry)
                    return entry.fs_type ~= 'file' or entry.name ~= '.DS_Store'
                end,

                sort = function(entries)
                    local function compare_alphanumerically(e1, e2)
                        if e1.is_dir and not e2.is_dir then
                            return true
                        end

                        if not e1.is_dir and e2.is_dir then
                            return false
                        end

                        if e1.pre_digits == e2.pre_digits and e1.digits ~= nil and e2.digits ~= nil then
                            return e1.digits < e2.digits
                        end

                        return e1.lower_name < e2.lower_name
                    end

                    local sorted = vim.tbl_map(function(entry)
                        local pre_digits, digits = entry.name:match '^(%D*)(%d+)'

                        if digits ~= nil then
                            digits = tonumber(digits)
                        end

                        return {
                            fs_type = entry.fs_type,
                            name = entry.name,
                            path = entry.path,
                            lower_name = entry.name:lower(),
                            is_dir = entry.fs_type == 'directory',
                            pre_digits = pre_digits,
                            digits = digits,
                        }
                    end, entries)

                    table.sort(sorted, compare_alphanumerically)

                    return vim.tbl_map(function(x)
                        return {
                            name = x.name,
                            fs_type = x.fs_type,
                            path = x.path,
                        }
                    end, sorted)
                end,
            },

            windows = {
                width_nofocus = 25,
            },

            options = {
                permanent_delete = false,
            },
        },

        on_setup = function()
            local group = vim.api.nvim_create_augroup('rxtsel/minifiles_explorer', { clear = true })

            vim.api.nvim_create_autocmd('User', {
                group = group,
                pattern = 'MiniFilesExplorerOpen',
                callback = function()
                    vim.g.minifiles_active = true
                end,
            })

            vim.api.nvim_create_autocmd('User', {
                group = group,
                pattern = 'MiniFilesExplorerClose',
                callback = function()
                    vim.g.minifiles_active = false
                end,
            })

            vim.api.nvim_create_autocmd('User', {
                desc = 'Add minifiles split keymaps',
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local buf_id = args.data.buf_id

                    map_split(buf_id, '<C-w>s', 'belowright horizontal')
                    map_split(buf_id, '<C-w>v', 'belowright vertical')
                end,
            })

            vim.keymap.set('n', '<leader>e', function()
                local bufname = vim.api.nvim_buf_get_name(0)
                local path = vim.fn.fnamemodify(bufname, ':p')

                if path and vim.uv.fs_stat(path) then
                    require('mini.files').open(bufname, false)
                end
            end, { desc = 'File explorer' })
        end,
    },
}

-- UI components.
add_on_event('VimEnter', {
    {
        src = 'nvim-mini/mini.statusline',
    },

    {
        src = 'nvim-mini/mini.notify',
    },

    {
        src = 'nvim-mini/mini.input',
    },
})

-- Starter.
add_on_event('VimEnter', {
    {
        src = 'nvim-mini/mini.starter',

        opts = {
            evaluate_single = true,
            footer = '',
            items = {
                {
                    name = 'Explorer',
                    action = 'lua MiniFiles.open()',
                    section = 'Pick',
                },
                {
                    name = 'Find files',
                    action = 'lua MiniPick.builtin.files()',
                    section = 'Pick',
                },
                {
                    name = 'Live grep',
                    action = 'lua MiniPick.builtin.grep_live()',
                    section = 'Pick',
                },
                {
                    name = 'New note',
                    action = 'Obsidian new',
                    section = 'Obsidian',
                },
                {
                    name = 'Create from template',
                    action = 'Obsidian new_from_template',
                    section = 'Obsidian',
                },
                {
                    name = 'Daily note',
                    action = 'Obsidian today',
                    section = 'Obsidian',
                },
                {
                    name = 'Quick switch',
                    action = 'Obsidian quick_switch',
                    section = 'Obsidian',
                },
                {
                    name = 'Search vault',
                    action = 'Obsidian search',
                    section = 'Obsidian',
                },
                {
                    name = 'Tags list',
                    action = 'Obsidian tags',
                    section = 'Obsidian',
                },
            },
        },
    },
})

-- Clue.
add_on_event('UIEnter', {
    {
        src = 'nvim-mini/mini.clue',

        opts = function()
            local miniclue = require 'mini.clue'

            for _, lhs in ipairs { '[%', ']%', 'g%' } do
                vim.keymap.del('n', lhs)
            end

            local function mark_clues()
                local marks = {}

                vim.list_extend(marks, vim.fn.getmarklist(vim.api.nvim_get_current_buf()))

                vim.list_extend(marks, vim.fn.getmarklist())

                return vim.iter(marks)
                    :map(function(mark)
                        local key = mark.mark:sub(2, 2)

                        if not string.match(key, '^%a') then
                            return nil
                        end

                        local desc

                        if mark.file then
                            desc = vim.fn.fnamemodify(mark.file, ':p:~:.')
                        elseif mark.pos[1] and mark.pos[1] ~= 0 then
                            local line_num = mark.pos[2]
                            local lines = vim.fn.getbufline(mark.pos[1], line_num)

                            if lines and lines[1] then
                                desc = string.format('%d: %s', line_num, lines[1]:gsub('^%s*', ''))
                            end
                        end

                        if desc then
                            return {
                                mode = 'n',
                                keys = string.format('`%s', key),
                                desc = desc,
                            }
                        end
                    end)
                    :totable()
            end

            local function macro_clues()
                local res = {}

                for _, register in ipairs(vim.split('abcdefghijklmnopqrstuvwxyz', '')) do
                    local keys = string.format('"%s', register)
                    local ok, desc = pcall(vim.fn.getreg, register)

                    if ok and desc ~= '' then
                        desc = string.format('register: %s', desc:gsub('%s+', ' '))

                        table.insert(res, {
                            mode = 'n',
                            keys = keys,
                            desc = desc,
                        })

                        table.insert(res, {
                            mode = 'v',
                            keys = keys,
                            desc = desc,
                        })
                    end
                end

                return res
            end

            return {
                triggers = {
                    { mode = { 'n', 'x' }, keys = 'g' },
                    { mode = { 'n', 'x' }, keys = '`' },
                    { mode = { 'n', 'x' }, keys = '"' },
                    { mode = { 'i', 'c' }, keys = '<C-r>' },
                    { mode = 'n', keys = '<C-w>' },
                    { mode = 'i', keys = '<C-x>' },
                    { mode = 'n', keys = 'z' },
                    { mode = { 'n', 'x' }, keys = '<leader>' },
                    { mode = 'n', keys = '[' },
                    { mode = 'n', keys = ']' },
                    { mode = 'n', keys = ';' },
                    { mode = 'n', keys = 't' },
                },

                clues = {
                    { mode = { 'n', 'x' }, keys = '<leader>c', desc = '+code' },
                    { mode = 'n', keys = '<leader>b', desc = '+buffers' },
                    { mode = 'n', keys = '<leader>x', desc = '+loclist/quickfix' },
                    { mode = 'n', keys = '<leader>o', desc = '+obsidian' },
                    { mode = 'n', keys = '<leader>g', desc = '+git' },
                    { mode = 'n', keys = '[', desc = '+prev' },
                    { mode = 'n', keys = ']', desc = '+next' },

                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),

                    mark_clues,
                    macro_clues,
                },

                window = {
                    delay = 500,
                    scroll_down = '<C-f>',
                    scroll_up = '<C-b>',
                },
            }
        end,
    },
})
