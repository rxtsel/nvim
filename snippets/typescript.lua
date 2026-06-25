local js = dofile(vim.fn.stdpath 'config' .. '/snippets/javascript.lua')
local ts = {
  { prefix = 'interf', body = 'interface $1 {\n\t$0\n}', desc = 'Interface' },
  { prefix = 'type', body = 'type $1 = $0', desc = 'Type alias' },
  { prefix = 'enum', body = 'enum $1 {\n\t$0\n}', desc = 'Enum' },
  { prefix = 'gfn', body = 'function $1<$2>($3): $4 {\n\t$0\n}', desc = 'Generic function' },
  { prefix = 'rec', body = 'Record<$1, $2>', desc = 'Record type' },
  { prefix = 'par', body = 'Partial<$1>', desc = 'Partial type' },
  { prefix = 'req', body = 'Required<$1>', desc = 'Required type' },
  { prefix = 'pick', body = 'Pick<$1, $2>', desc = 'Pick type' },
  { prefix = 'omit', body = 'Omit<$1, $2>', desc = 'Omit type' },
  { prefix = 'tfn', body = 'function $1($2: $3): $4 {\n\t$0\n}', desc = 'Typed function' },
  { prefix = 'taf', body = 'const $1 = ($2: $3): $4 => {\n\t$0\n}', desc = 'Typed arrow function' },
}
return vim.list_extend(vim.deepcopy(js), ts)
