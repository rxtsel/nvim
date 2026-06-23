local add_on_event = require('vim-pack').add_on_event

local function root_has_file(filenames)
    return vim.fs.find(filenames, {
        upward = true,
        path = vim.fn.expand '%:p:h',
        stop = vim.loop.os_homedir(),
    })[1] ~= nil
end

local function pick_web_formatters()
    if root_has_file { 'biome.json', 'biome.jsonc' } then
        return { 'biome' }
    end
    if root_has_file { '.oxfmtrc.json', '.oxfmtrc.jsonc', 'oxfmt.config.ts' } then
        return { 'oxfmt' }
    end
    if
        root_has_file {
            '.prettierrc',
            '.prettierrc.json',
            '.prettierrc.jsonc',
            '.prettierrc.js',
            '.prettierrc.cjs',
            '.prettierrc.mjs',
            'prettier.config.js',
            'prettier.config.cjs',
            'prettier.config.mjs',
        }
    then
        return { 'prettierd' }
    end
    return { 'oxfmt', 'biome', 'prettierd', stop_after_first = true }
end

add_on_event('BufWritePre', {
    {
        src = 'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = pick_web_formatters,
                javascriptreact = pick_web_formatters,
                typescript = pick_web_formatters,
                typescriptreact = pick_web_formatters,
                json = pick_web_formatters,
                html = pick_web_formatters,
                css = pick_web_formatters,
                astro = pick_web_formatters,
                svelte = pick_web_formatters,
                lua = { 'stylua' },
                rust = { 'rustfmt' },
                nix = { 'alejandra' },
            },
            formatters = {
                biome = { command = 'biome', require_cwd = false },
                oxfmt = { command = 'oxfmt', require_cwd = false },
                prettierd = { command = 'prettierd', require_cwd = false },
            },
            format_on_save = function()
                -- Don't format when minifiles is open, since that triggers the "confirm without
                -- synchronization" message.
                if vim.g.minifiles_active then
                    return nil
                end

                -- Skip formatting if triggered from my special save command.
                if vim.g.skip_formatting then
                    vim.g.skip_formatting = false
                    return nil
                end

                -- Stop if we disabled auto-formatting.
                if not vim.g.autoformat then
                    return nil
                end

                return {
                    timeout_ms = 1000,
                    lsp_format = 'fallback',
                }
            end,
        },
    },
})

-- Use conform for gq.
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Start auto-formatting by default (and disable with my ToggleFormat command).
vim.g.autoformat = true
