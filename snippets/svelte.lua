local ts = dofile(vim.fn.stdpath 'config' .. '/snippets/typescript.lua')
local svelte = {
  {
    prefix = 'sif',
    body = '{#if $1}\n\t$0\n{/if}',
    desc = 'Svelte if',
  },
  {
    prefix = 'sife',
    body = '{#if $1}\n\t$2\n{:else}\n\t$0\n{/if}',
    desc = 'Svelte if else',
  },
  {
    prefix = 'seach',
    body = '{#each $1 as $2}\n\t$0\n{/each}',
    desc = 'Svelte each',
  },
  {
    prefix = 'seachi',
    body = '{#each $1 as $2, i}\n\t$0\n{/each}',
    desc = 'Svelte each (index)',
  },
  {
    prefix = 'sawait',
    body = '{#await $1}\n\t<p>Loading...</p>\n{:then $2}\n\t$0\n{:catch error}\n\t<p>{error.message}</p>\n{/await}',
    desc = 'Svelte await',
  },
  {
    prefix = 'skey',
    body = '{#key $1}\n\t$0\n{/key}',
    desc = 'Svelte key',
  },
  {
    prefix = 'sbind',
    body = 'bind:$1={$0}',
    desc = 'bind directive',
  },
  {
    prefix = 'sclass',
    body = 'class:$1={$0}',
    desc = 'class directive',
  },
  {
    prefix = 'suse',
    body = 'use:$1={$0}',
    desc = 'action directive',
  },
  {
    prefix = 'strans',
    body = 'transition:$1',
    desc = 'transition',
  },
  {
    prefix = 'sscript',
    body = '<script>\n\t$0\n</script>',
    desc = 'script tag',
  },
  {
    prefix = 'sscriptts',
    body = '<script lang="ts">\n\t$0\n</script>',
    desc = 'script tag (TS)',
  },
  {
    prefix = 'sstate',
    body = 'let $1 = $state($0)',
    desc = '$state',
  },
  {
    prefix = 'sderived',
    body = 'let $1 = $derived($0)',
    desc = '$derived',
  },
  {
    prefix = 'seffect',
    body = '$effect(() => {\n\t$0\n})',
    desc = '$effect',
  },
  {
    prefix = 'sprops',
    body = 'let { $1 } = $props()',
    desc = '$props',
  },
}
return vim.list_extend(vim.deepcopy(ts), svelte)
