local ts = dofile(vim.fn.stdpath 'config' .. '/snippets/typescript.lua')
local jsx = dofile(vim.fn.stdpath 'config' .. '/snippets/javascriptreact.lua')

local tsx = {
  {
    prefix = 'rfct',
    desc = 'Typed React function component',
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
    prefix = 'rsfc',
    desc = 'Next.js async server component',
    body = {
      'interface ${1:Component}Props {',
      '\t$2',
      '}',
      '',
      'export default async function ${1:Component}({ $3 }: ${1:Component}Props) {',
      '\t$4',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  {
    prefix = 'rpfc',
    desc = 'Next.js page with params + searchParams',
    body = {
      'interface ${1:Component}Props {',
      '\tparams: Promise<{ $2: string }>',
      '\tsearchParams: Promise<{ [key: string]: string | string[] | undefined }>',
      '}',
      '',
      'export default async function ${1:Component}({ params, searchParams }: ${1:Component}Props) {',
      '\tconst { $3 } = await params',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  { prefix = 'ust', body = 'const [$1, set$2] = useState<$3>($4)', desc = 'Typed useState' },
  { prefix = 'urt', body = 'const $1 = useRef<$2>($3)', desc = 'Typed useRef' },
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
