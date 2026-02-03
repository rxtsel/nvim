require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.icons").setup()
require("mini.snippets").setup({
	snippets = {
		require("mini.snippets").gen_loader.from_file("~/.config/nvim/snippets/global.lua"),
		require("mini.snippets").gen_loader.from_lang(),
	},
})
