local M = {}

local function file_path(absolute)
	local filename = vim.api.nvim_buf_get_name(0)
	if filename == "" or vim.bo.buftype ~= "" then
		return nil
	end
	filename = vim.fs.normalize(filename)
	if absolute then
		return filename
	end

	local directory = vim.fs.normalize(vim.fn.getcwd())
	local prefix = ""
	while directory do
		local relative = vim.fs.relpath(directory, filename)
		if relative then
			return prefix .. relative
		end
		local parent = vim.fs.dirname(directory)
		if parent == directory then
			break
		end
		directory = parent
		prefix = prefix .. "../"
	end
	return filename
end

function M.copy_path(absolute)
	local path = file_path(absolute)
	if not path then
		vim.notify("Current buffer has no file path", vim.log.levels.WARN)
		return
	end
	local text = path .. "#L" .. vim.api.nvim_win_get_cursor(0)[1]
	vim.fn.setreg("+", text)
	vim.notify(text)
end

function M.copy_selection()
	local start = vim.fn.getpos("v")
	local finish = vim.fn.getpos(".")
	local lines = vim.fn.getregion(start, finish, {
		type = vim.fn.mode(),
		exclusive = vim.o.selection == "exclusive",
	})
	local text = table.concat(lines, "\n")
	local fence = "```"
	for ticks in text:gmatch("`+") do
		if #ticks >= #fence then
			fence = string.rep("`", #ticks + 1)
		end
	end

	local languages = { typescriptreact = "tsx", javascriptreact = "jsx", typescript = "ts", javascript = "js" }
	local language = languages[vim.bo.filetype] or vim.bo.filetype
	local filename = vim.json.encode(file_path(false) or "[No Name]")
	local line = math.min(start[2], finish[2])
	local header = fence .. language .. " filename=" .. filename .. " line=" .. line
	vim.fn.setreg("+", header .. "\n" .. text .. "\n" .. fence)
	vim.notify("Selection copied as Markdown code block")
end

function M.package_json()
	local filename = file_path(true)
	local path = vim.fs.find("package.json", {
		path = filename and vim.fs.dirname(filename) or vim.fn.getcwd(),
		upward = true,
		type = "file",
	})[1]
	if not path then
		vim.notify("No package.json found for the current project", vim.log.levels.WARN)
	end
	return path
end

return M
