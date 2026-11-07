local M = {}

local root_markers = { ".git", "lua", "package.json", "Makefile", "Cargo.toml", "go.mod", "pyproject.toml" }

function M.project_name()
	local cwd = vim.fn.getcwd()
	local start = vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) or ""
	local root = vim.fs.root(start ~= "" and start or cwd, root_markers)
	if not root or vim.fs.normalize(root) == vim.fs.normalize(cwd) then
		return ""
	end
	return vim.fn.fnamemodify(root, ":t"):gsub("%%", "%%%%")
end

function M.pretty_path()
	local name = vim.api.nvim_buf_get_name(0)
	if vim.bo.buftype == "terminal" then
		return "[Terminal]"
	elseif name == "" then
		return "[No Name]"
	end
	return vim.fn.fnamemodify(name, ":~:."):gsub("%%", "%%%%")
end

function M.recording()
	local register = vim.fn.reg_recording()
	return register ~= "" and "recording @" .. register or ""
end

return M
