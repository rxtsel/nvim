local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Load utils using absolute path
local utils_path = vim.fn.stdpath("config") .. "/snippets/_utils.lua"
local utils = dofile(utils_path)

-- Helper function to get component name from filename
local function get_component_name()
	local name = vim.fn.expand("%:t:r")
	if not name or name == "" then
		return "Component"
	end
	return utils.to_pascal_case(name)
end

return {
	s(
		{ trig = "rfc", desc = "Creates a React functional component" },
		fmt(
			[[
export {} function {}({}) {{
  return <h1>{}</h1>
}}
]],
			{
				i(1, "default"),
				f(get_component_name),
				i(3, "props"),
				f(get_component_name),
			}
		)
	),

	s(
		{ trig = "rafc", desc = "Creates a React arrow function component with named export" },
		fmt(
			[[
export const {} = ({}) => {{
  return <h1>{}</h1>
}}
]],
			{
				f(get_component_name),
				i(2, "props"),
				f(get_component_name),
			}
		)
	),

	s(
		{ trig = "rafce", desc = "Creates a React arrow function component with export at end" },
		fmt(
			[[
const {} = ({}) => {{
  return <h1>{}</h1>
}}

{}{}
]],
			{
				d(1, function()
					return sn(nil, {
						i(1, get_component_name()),
					})
				end),
				i(2, "props"),
				rep(1),
				c(3, {
					f(function(args)
						local component_name = args[1][1] or "Component"
						return "export default " .. component_name
					end, { 1 }),
					f(function(args)
						local component_name = args[1][1] or "Component"
						return "export { " .. component_name .. " }"
					end, { 1 }),
				}),
				i(0),
			}
		)
	),
}
