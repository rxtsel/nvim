local config_path = vim.fn.stdpath("config")
local ts = dofile(config_path .. "/snippets/typescript.lua")
local jsx = dofile(config_path .. "/snippets/javascriptreact.lua")
local js = dofile(config_path .. "/snippets/javascript.lua")

-- Get only JSX-specific snippets (not the JS ones)
local jsx_only = {}
local js_prefixes = {}
for _, s in ipairs(js) do
	js_prefixes[s.prefix] = true
end
for _, s in ipairs(jsx) do
	if not js_prefixes[s.prefix] then
		table.insert(jsx_only, s)
	end
end

local tsx_snippets = {
	-- Typed React components
	{
		prefix = "rfct",
		body = "interface $1Props {\n  $2\n}\n\nexport function $1({ $3 }: $1Props) {\n  return (\n    <div>$0</div>\n  )\n}",
		desc = "Typed React function component",
	},
	{ prefix = "ust", body = "const [$1, set${1/(.*)/${1:/capitalize}/}] = useState<$2>($3)", desc = "Typed useState" },
	{ prefix = "urt", body = "const $1 = useRef<$2>($3)", desc = "Typed useRef" },
}

local result = vim.list_extend(vim.deepcopy(ts), jsx_only)
return vim.list_extend(result, tsx_snippets)
