local js = dofile(vim.fn.stdpath("config") .. "/snippets/javascript.lua")

local jsx_snippets = {
	-- Components
	{
		prefix = "rfc",
		body = "export function $1() {\n  return (\n    <div>$0</div>\n  )\n}",
		desc = "React function component",
	},
	{
		prefix = "rafce",
		body = "const $1 = () => {\n  return (\n    <div>$0</div>\n  )\n}\n\nexport default $1",
		desc = "React arrow component export",
	},

	-- Hooks
	{ prefix = "us", body = "const [$1, set${1/(.*)/${1:/capitalize}/}] = useState($2)", desc = "useState" },
	{ prefix = "ue", body = "useEffect(() => {\n  $0\n}, [$1])", desc = "useEffect" },
	{ prefix = "uc", body = "const $1 = useCallback(($2) => {\n  $0\n}, [$3])", desc = "useCallback" },
	{ prefix = "um", body = "const $1 = useMemo(() => $2, [$3])", desc = "useMemo" },
	{ prefix = "ur", body = "const $1 = useRef($2)", desc = "useRef" },
	{ prefix = "uct", body = "const $1 = useContext($2)", desc = "useContext" },

	-- JSX elements
	{ prefix = "frag", body = "<>\n  $0\n</>", desc = "Fragment" },
	{ prefix = "cn", body = 'className="$0"', desc = "className" },
}

return vim.list_extend(vim.deepcopy(js), jsx_snippets)
