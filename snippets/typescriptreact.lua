local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/snippets/?.lua"
local utils_ok, utils = pcall(require, "_utils")

local function segment_default()
	if not utils_ok then
		return "Page"
	end
	local parent = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
	local name = utils.to_pascal_case(parent or "")
	return (name ~= "" and name) or "Page"
end

local function segment_name_editable(_, _)
	return sn(nil, i(1, segment_default()))
end

return {
	s(
		{ trig = "npage", desc = "Next.js App Router page.tsx" },
		fmt(
			[[
import type {{ Metadata }} from "next";

export const metadata: Metadata = {{
  title: "{}",
}};

export default function {}() {{
  return (
    <main>
      <h1>{}</h1>
    </main>
  );
}}
]],
			{
				rep(1),
				d(1, segment_name_editable),
				rep(1),
			}
		)
	),

	s(
		{ trig = "nlayout", desc = "Next.js App Router layout.tsx" },
		fmt(
			[[
import type {{ PropsWithChildren }} from "react";

export default function {}Layout({{ children }}: PropsWithChildren) {{
  return <>{{children}}</>;
}}
]],
			{
				d(1, segment_name_editable),
			}
		)
	),
}
