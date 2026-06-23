local M = {}

local function file_contains_any(path, patterns)
    local f = io.open(path, 'r')
    if not f then
        return false
    end
    for line in f:lines() do
        for _, pat in ipairs(patterns) do
            if line:find(pat) then
                f:close()
                return true
            end
        end
    end
    f:close()
    return false
end

local function file_contains_all(path, patterns)
    local remaining = vim.deepcopy(patterns)
    local f = io.open(path, 'r')
    if not f then
        return false
    end
    for line in f:lines() do
        remaining = vim.iter(remaining)
            :filter(function(pat)
                return not line:find(pat)
            end)
            :totable()
        if #remaining == 0 then
            f:close()
            return true
        end
    end
    f:close()
    return false
end

function M.get_typescript_server_path(root_dir)
    local ts_path = vim.fs.find('node_modules/typescript/lib', {
        path = root_dir,
        upward = true,
        type = 'directory',
        limit = 1,
    })
    return ts_path[1] or ''
end

function M.insert_package_json(root_files, packages, fname)
    return M.root_markers_with_field(root_files, { 'package.json', 'package.json5' }, packages, fname)
end

function M.root_markers_with_field(root_files, new_names, field, fname, match_mode)
    local path = vim.fs.dirname(fname)
    local found = vim.fs.find(new_names, { path = path, upward = true, type = 'file' })
    local fields = type(field) == 'string' and { field } or field
    local matcher = (match_mode or 'any') == 'all' and file_contains_all or file_contains_any

    for _, f in ipairs(found or {}) do
        if matcher(f, fields) then
            root_files[#root_files + 1] = vim.fs.basename(f)
        end
    end
    return root_files
end

return M
