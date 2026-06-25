local js = dofile(vim.fn.stdpath 'config' .. '/snippets/javascript.lua')
local jsx = {
  {
    prefix = 'rfc',
    desc = 'React function component',
    body = {
      'export function ${1:Component}() {',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  {
    prefix = 'rafc',
    desc = 'React arrow function component',
    body = {
      'export const ${1:Component} = () => {',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
    },
  },
  {
    prefix = 'rafce',
    desc = 'React arrow function component (default export)',
    body = {
      'const ${1:Component} = () => {',
      '\treturn (',
      '\t\t<div>$0</div>',
      '\t)',
      '}',
      '',
      'export default ${1:Component}',
    },
  },

  { prefix = 'useStateSnippet', body = 'const [$1, set$2] = useState($3)', desc = 'useState hook' },
  { prefix = 'useEffectSnippet', body = 'useEffect(() => {\n\t$0\n}, [$1])', desc = 'useEffect hook' },
  { prefix = 'useCallbackSnippet', body = 'const $1 = useCallback(($2) => {\n\t$0\n}, [$3])', desc = 'useCallback hook' },
  { prefix = 'useMemoSnippet', body = 'const $1 = useMemo(() => $2, [$3])', desc = 'useMemo hook' },
  { prefix = 'useRefSnippet', body = 'const $1 = useRef($2)', desc = 'useRef hook' },
  { prefix = 'useContextSnippet', body = 'const $1 = useContext($2)', desc = 'useContext hook' },
  { prefix = 'frag', body = '<>\n\t$0\n</>', desc = 'Fragment' },
  { prefix = 'cn', body = 'className="$0"', desc = 'className' },
}
return vim.list_extend(vim.deepcopy(js), jsx)
