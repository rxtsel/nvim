local M = {}

vim.g.inlay_hints = false

local function on_attach(client, bufnr)
    local function keymap(lhs, rhs, opts, mode)
        mode = mode or 'n'
        opts = type(opts) == 'string' and { desc = opts } or opts
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    keymap('[e', function()
        vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
    end, 'Previous error')
    keymap(']e', function()
        vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
    end, 'Next error')

    if client:supports_method 'textDocument/codeAction' then
        require('lightbulb').attach_lightbulb(bufnr, client)
    end

    if client:supports_method 'textDocument/documentColor' then
        keymap('grc', function()
            vim.lsp.document_color.color_presentation()
        end, 'Color presentation', { 'n', 'x' })
    end

    if client:supports_method 'textDocument/references' then
        keymap('grr', vim.lsp.buf.references, 'References')
    end

    if client:supports_method 'textDocument/typeDefinition' then
        keymap('gy', vim.lsp.buf.type_definition, 'Type definition')
    end

    if client:supports_method 'textDocument/documentSymbol' then
        keymap('<leader>cs', function()
            vim.lsp.buf.document_symbol()
        end, 'Document symbols')
    end

    if client:supports_method 'textDocument/definition' then
        keymap('gd', vim.lsp.buf.definition, 'Go to definition')
        keymap('gD', function()
            vim.lsp.buf.hover()
        end, 'Peek definition')
    end

    if client:supports_method 'textDocument/signatureHelp' then
        keymap('<C-k>', function()
            local ok, blink = pcall(require, 'blink.cmp')
            if ok and blink and blink.hide then
                blink.hide()
            end
            vim.lsp.buf.signature_help()
        end, 'Signature help', 'i')
    end

    if client:supports_method 'textDocument/documentHighlight' then
        local hl_group = vim.api.nvim_create_augroup('lsp_cursor_highlights', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'InsertLeave' }, {
            group = hl_group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
            group = hl_group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    if client:supports_method 'textDocument/inlayHint' then
        local ih_group = vim.api.nvim_create_augroup('lsp_inlay_hints', { clear = false })
        if vim.g.inlay_hints then
            vim.defer_fn(function()
                vim.lsp.inlay_hint.enable(vim.api.nvim_get_mode().mode ~= 'i', { bufnr = bufnr })
            end, 500)
        end
        vim.api.nvim_create_autocmd('InsertEnter', {
            group = ih_group,
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end
            end,
        })
        vim.api.nvim_create_autocmd('InsertLeave', {
            group = ih_group,
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        })
    end

    if client.name == 'copilot' and client:supports_method 'textDocument/inlineCompletion' then
        vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
        keymap('<A-l>', vim.lsp.inline_completion.get, 'Trigger inline completion', 'i')
        keymap('<A-]>', vim.lsp.inline_completion.select, 'Select next inline completion', 'i')
    end
end

local function normalize(severity)
    return severity:sub(1, 1) .. severity:sub(2):lower()
end

local diagnostic_icons = {
    Error = '󰅚',
    Warn = '󰀪',
    Info = '󰋼',
    Hint = '󰌵',
}

local function icon(severity)
    return diagnostic_icons[normalize(severity)]
end

for _, sev in ipairs { 'Error', 'Warn', 'Info', 'Hint' } do
    vim.fn.sign_define('DiagnosticSign' .. sev, {
        text = icon(sev),
        texthl = 'DiagnosticSign' .. sev,
    })
end

vim.diagnostic.config {
    virtual_text = {
        prefix = '',
        spacing = 2,
        format = function(diagnostic)
            local parts = { icon(vim.diagnostic.severity[diagnostic.severity]) }
            if diagnostic.source then
                table.insert(parts, diagnostic.source)
            end
            if diagnostic.code then
                table.insert(parts, '[' .. tostring(diagnostic.code) .. ']')
            end
            return table.concat(parts, ' ') .. ' '
        end,
    },
    float = {
        source = 'if_many',
        prefix = function(diag)
            local level = vim.diagnostic.severity[diag.severity]
            return ' ' .. icon(level) .. ' ', 'Diagnostic' .. normalize(level)
        end,
    },
    signs = false,
    status = {
        format = function(counts)
            local items = {}
            for severity, count in pairs(counts) do
                local name = vim.diagnostic.severity[severity]
                local hl = 'DiagnosticSign' .. name:sub(1, 1) .. name:sub(2):lower()
                table.insert(items, ('%%#%s#%s %d%%*'):format(hl, icon(name), count))
            end
            return table.concat(items, ' ')
        end,
    },
}

local show_handler = vim.diagnostic.handlers.virtual_text.show
local hide_handler = vim.diagnostic.handlers.virtual_text.hide
vim.diagnostic.handlers.virtual_text = {
    show = function(ns, bufnr, diagnostics, opts)
        table.sort(diagnostics, function(a, b)
            return a.severity > b.severity
        end)
        return show_handler(ns, bufnr, diagnostics, opts)
    end,
    hide = hide_handler,
}

local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
    return hover {
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    }
end

local sig = vim.lsp.buf.signature_help
vim.lsp.buf.signature_help = function()
    return sig {
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    }
end

local register_capability = vim.lsp.handlers['client/registerCapability']
vim.lsp.handlers['client/registerCapability'] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client then
        on_attach(client, vim.api.nvim_get_current_buf())
    end
    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            on_attach(client, args.buf)
        end
    end,
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    once = true,
    callback = function()
        local ok, blink = pcall(require, 'blink.cmp')
        if ok then
            vim.lsp.config('*', { capabilities = blink.get_lsp_capabilities(nil, true) })
        end

        local servers = vim.iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ':t:r')
            end)
            :totable()

        vim.lsp.enable(servers)
    end,
})

vim.api.nvim_create_user_command('TogggleInlayHints', function()
    vim.g.inlay_hints = not vim.g.inlay_hints
    vim.notify('Inlay hints ' .. (vim.g.inlay_hints and 'enabled' or 'disabled'))
end, {})

local buf_request = vim.lsp.buf_request
vim.lsp.buf_request = function(bufnr, method, params, handler)
    return buf_request(bufnr, method, params, handler, function() end)
end

return M
