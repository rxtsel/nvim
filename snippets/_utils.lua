local M = {}

-- Convert "dollar-input" / "dollar_input" / "dollar input" / "dollar.input" → "DollarInput"
function M.to_pascal_case(str)
	if not str or str == "" then
		return ""
	end
	str = str:gsub("[%-_%.%s]+", " ")
	local out = str:gsub("(%a)([%w]*)", function(first, rest)
		return first:upper() .. rest:lower()
	end)
	out = out:gsub("%s+", "")
	if out:match("^[0-9]") then
		out = "C" .. out
	end
	return out
end

-- Return current filename (without extension) as PascalCase
function M.filename_pascal()
	local name = vim.fn.expand("%:t:r")
	if not name or name == "" then
		return "Component"
	end
	return M.to_pascal_case(name)
end

return M
