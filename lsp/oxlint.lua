-- Install with: npm i -g oxlint

local util = require 'lsp-util'

local function oxlint_conf_mentions_typescript(root_dir)
    local fn = vim.fs.joinpath(root_dir, '.oxlintrc.json')
    for line in io.lines(fn) do
        if line:find 'typescript' then
            return true
        end
    end
    return false
end

---@type vim.lsp.Config
return {
    cmd = function(dispatchers, config)
        local cmd = 'oxlint'
        if (config or {}).root_dir then
            local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', cmd)
            if vim.fn.executable(local_cmd) == 1 then
                cmd = local_cmd
            end
        end
        return vim.lsp.rpc.start({ cmd, '--lsp' }, dispatchers)
    end,
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'svelte',
        'astro',
    },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)

        local root_markers = util.insert_package_json(
            { '.oxlintrc.json', '.oxlintrc.jsonc', 'oxlint.config.ts' },
            { 'oxlint', 'vite%-plus' },
            fname
        )
        -- find vite plus config with lint field
        root_markers = util.root_markers_with_field(
            root_markers,
            { 'vite.config.ts' },
            { 'vite%-plus', 'lint:' },
            fname,
            'all'
        )
        on_dir(vim.fs.dirname(vim.fs.find(root_markers, { path = fname, upward = true })[1]))
    end,
    workspace_required = true,
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspOxlintFixAll', function()
            client:exec_cmd {
                title = 'Apply Oxlint automatic fixes',
                command = 'oxc.fixAll',
                arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
            }
        end, {
            desc = 'Apply Oxlint automatic fixes',
        })
    end,
    settings = {
        -- run = 'onType',
        -- configPath = nil,
        -- tsConfigPath = nil,
        -- unusedDisableDirectives = 'allow',
        -- typeAware = false,
        -- disableNestedConfig = false,
        -- fixKind = 'safe_fix',
    },
    before_init = function(init_params, config)
        local settings = config.settings or {}
        local has_tsgolint = vim.fn.executable 'tsgolint' == 1
        if not has_tsgolint and (config or {}).root_dir then
            local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', 'tsgolint')
            has_tsgolint = vim.fn.executable(local_cmd) == 1
        end
        if settings.typeAware == nil and has_tsgolint then
            local ok, res = pcall(oxlint_conf_mentions_typescript, config.root_dir)
            if ok and res then
                settings = vim.tbl_extend('force', settings, { typeAware = true })
            end
        end
        local init_options = config.init_options or {}
        init_options.settings = vim.tbl_extend('force', init_options.settings or {} --[[@as table]], settings)

        init_params.initializationOptions = init_options
    end,
}
