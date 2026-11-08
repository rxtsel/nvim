local M = {}

function M.open_lazygit()
	vim.g.rxtsel_lazygit_win = vim.api.nvim_get_current_win()
	Snacks.lazygit({ env = { SHELL = vim.fn.exepath("sh") } })
end

function M.toggle_stage_buffer()
	local gitsigns = require("gitsigns")
	local hunks = gitsigns.get_hunks()
	if not hunks then
		return
	end
	if #hunks > 0 then
		gitsigns.stage_buffer()
	else
		gitsigns.reset_buffer_index()
	end
end

function M.open_line_revision()
	local bufnr = vim.api.nvim_get_current_buf()
	local filename = vim.api.nvim_buf_get_name(bufnr)
	local root = vim.fs.root(bufnr, ".git")
	if not root or filename == "" then
		vim.notify("Current file is not in a Git repository", vim.log.levels.WARN)
		return
	end

	local line = vim.api.nvim_win_get_cursor(0)[1]
	local contents = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n") .. "\n"
	vim.system(
		{
			"git",
			"-C",
			root,
			"blame",
			"--line-porcelain",
			"-L",
			line .. "," .. line,
			"--contents",
			"-",
			"--",
			filename,
		},
		{ text = true, stdin = contents },
		vim.schedule_wrap(function(result)
			if result.code ~= 0 then
				vim.notify(vim.trim(result.stderr), vim.log.levels.ERROR)
				return
			end
			local revision = result.stdout:match("^(%x+)")
			if not revision or revision:match("^0+$") then
				vim.notify("This line has not been committed", vim.log.levels.INFO)
				return
			end
			if vim.api.nvim_buf_is_valid(bufnr) then
				vim.cmd("tab sbuffer " .. bufnr)
				require("gitsigns").show(revision)
			end
		end)
	)
end

return M
