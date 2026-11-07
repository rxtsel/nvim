local M = {}

local function tab_label(buf)
	local name = vim.api.nvim_buf_get_name(buf)
	local label, icon

	if vim.bo[buf].buftype == "terminal" then
		label = "[Terminal]"
	elseif name == "" then
		label = "[No Name]"
	else
		label = vim.fn.fnamemodify(name, ":t")
		icon = require("mini.icons").get("file", name)
	end

	if vim.fn.strchars(label) > 20 then
		label = vim.fn.strcharpart(label, 0, 17) .. "…"
	end

	local modified = vim.bo[buf].modified and "[+] " or ""
	return ("   " .. modified .. (icon and icon .. " " or "") .. label .. "   "):gsub("%%", "%%%%")
end

function M.render()
	local current = vim.api.nvim_get_current_tabpage()
	local parts = {}

	for index, tab in ipairs(vim.api.nvim_list_tabpages()) do
		local active = tab == current
		local text_hl = active and "RxtselTabActive" or "RxtselTabInactive"
		local edge_hl = active and "RxtselTabActiveEdge" or "RxtselTabInactiveEdge"
		local buf = vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))

		parts[#parts + 1] = "%" .. index .. "T"
		parts[#parts + 1] = "%#" .. edge_hl .. "#"
		parts[#parts + 1] = "%#" .. text_hl .. "#" .. tab_label(buf)
		parts[#parts + 1] = "%#" .. edge_hl .. "#"
	end

	parts[#parts + 1] = "%T%#RxtselTabFill#"
	return table.concat(parts)
end

function M.setup()
	local colors = require("solarized-osaka.colors").setup()
	vim.api.nvim_set_hl(0, "RxtselTabActive", { fg = colors.base4, bg = colors.yellow, bold = true })
	vim.api.nvim_set_hl(0, "RxtselTabInactive", { fg = colors.base0, bg = colors.base02 })
	vim.api.nvim_set_hl(0, "RxtselTabActiveEdge", { fg = colors.yellow, bg = "NONE" })
	vim.api.nvim_set_hl(0, "RxtselTabInactiveEdge", { fg = colors.base02, bg = "NONE" })
	vim.api.nvim_set_hl(0, "RxtselTabFill", { fg = colors.base0, bg = "NONE" })

	vim.opt.showtabline = 1
	vim.opt.tabline = "%!v:lua.Rxtsel.tabline.render()"
end

return M
