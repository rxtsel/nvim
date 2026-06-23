-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.hl.on_yank { timeout = 170 }
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

-- Fix all lints on save if the project has an oxc config file.
local function root_has_oxlint(path)
    return vim.fs.find({
        '.oxlintrc.json',
        '.oxlintrc.jsonc',
        'oxlint.config.ts',
    }, {
        upward = true,
        path = path,
        stop = vim.loop.os_homedir(),
    })[1] ~= nil
end

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('OxlintFixOnSave', { clear = true }),
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.vue', '*.svelte', '*.astro' },
    callback = function(args)
        local path = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf))
        if not root_has_oxlint(path) then
            return
        end

        local clients = vim.lsp.get_clients { bufnr = args.buf, name = 'oxlint' }
        if #clients == 0 then
            return
        end

        clients[1]:request_sync('workspace/executeCommand', {
            command = 'oxc.fixAll',
            arguments = {
                {
                    uri = vim.uri_from_bufnr(args.buf),
                    version = vim.lsp.util.buf_versions[args.buf],
                },
            },
        }, 1000, args.buf)
    end,
})

-- Enable line wrapping and spell checking for text files.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('BetterReadForTextFiles', { clear = true }),
    pattern = { 'markdown', 'text', 'gitcommit' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
    end,
})

-- Enable spell checking for specific file types.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- Disable syntax highlighting in big files for performance.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('big_file', { clear = true }),
    desc = 'Disable features in big files',
    pattern = 'bigfile',
    callback = function(args)
        vim.schedule(function()
            vim.bo[args.buf].syntax = vim.filetype.match { buf = args.buf } or ''
        end)
    end,
})

-- Close certain buffers with <q>.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
    desc = 'Close with <q>',
    pattern = {
        'git',
        'help',
        'man',
        'qf',
        'scratch',
    },
    callback = function(args)
        if args.match ~= 'help' or not vim.bo[args.buf].modifiable then
            vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
        end
    end,
})

-- Go to the last location when opening a buffer.
vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

-- Toggle relative line numbers.
local line_numbers_group = vim.api.nvim_create_augroup('toggle_line_numbers', {})
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers on',
    callback = function()
        if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then
            vim.wo.relativenumber = true
        end
    end,
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers off',
    callback = function(args)
        if vim.wo.nu then
            vim.wo.relativenumber = false
        end
        if args.event == 'CmdlineEnter' then
            if not vim.tbl_contains({ '@', '-' }, vim.v.event.cmdtype) then
                vim.cmd.redraw()
            end
        end
    end,
})
