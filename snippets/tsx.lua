local ts = dofile(vim.fn.stdpath 'config' .. '/snippets/typescript.lua')
local jsx = dofile(vim.fn.stdpath 'config' .. '/snippets/javascriptreact.lua')

local tsx = {
  {
    prefix = 'tsrfc',
    desc = 'TypeScript React functional component with props interface',
    body = {
      'interface ${1:Component}Props {',
      '\t$2',
      '}',
      '',
      'export function ${1:Component}({ $3 }: ${1:Component}Props) {',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  {
    prefix = 'tsrafc',
    desc = 'TypeScript React arrow function component',
    body = {
      'export const ${1:Component} = (props: React.ComponentProps<"$2">) => {',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  { prefix = 'useStateSnippetT', body = 'const [$1, set$2] = useState<$3>($4)', desc = 'Typed useState hook' },
  { prefix = 'useRefSnippetT', body = 'const $1 = useRef<$2>($3)', desc = 'Typed useRef hook' },
}

-- jsx already contains js internally, ts also contains js
-- we only need JSX-specific snippets, not the entire jsx table
-- extract only those not already in ts
local ts_prefixes = {}
for _, s in ipairs(ts) do
  ts_prefixes[s.prefix] = true
end

local result = vim.deepcopy(ts)
for _, s in ipairs(jsx) do
  if not ts_prefixes[s.prefix] then
    table.insert(result, s)
  end
end
vim.list_extend(result, tsx)
return result
