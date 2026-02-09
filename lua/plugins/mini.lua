require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
  mappings = {
    add = 'gsa',
    delete = 'gsd',
    find = 'gsf',
    find_left = 'gsF',
    highlight = 'gsh',
    replace = 'gsr',
    suffix_last = 'l',
    suffix_next = 'n',
  },
})
require("mini.statusline").setup()
require("mini.icons").setup()
