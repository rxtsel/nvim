local ts = dofile(vim.fn.stdpath 'config' .. '/snippets/typescript.lua')

local astro = {
  {
    prefix = 'comp',
    body = '---\ninterface Props {\n\t$1\n}\n\nconst { $2 } = Astro.props\n---\n\n<div>\n\t$0\n</div>',
    desc = 'Astro component with Props interface',
  },
  {
    prefix = 'amap',
    body = '{$1.map(($2) => (\n\t$0\n))}',
    desc = 'Astro map expression',
  },
  {
    prefix = 'aif',
    body = '{$1 && (\n\t$0\n)}',
    desc = 'Conditional render with &&',
  },
  {
    prefix = 'ater',
    body = '{$1 ? (\n\t$2\n) : (\n\t$0\n)}',
    desc = 'Ternary expression',
  },
  {
    prefix = 'slot',
    body = '<slot />',
    desc = 'Default slot',
  },
  {
    prefix = 'slotn',
    body = '<slot name="$1" />',
    desc = 'Named slot',
  },
  {
    prefix = 'glob',
    body = "const $1 = await Astro.glob('$0')",
    desc = 'Astro.glob import',
  },
  {
    prefix = 'redirect',
    body = "return Astro.redirect('$0')",
    desc = 'Astro.redirect',
  },
}

local result = vim.deepcopy(ts)
return vim.list_extend(result, astro)
