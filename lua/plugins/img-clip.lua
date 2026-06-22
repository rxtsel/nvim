require("img-clip").setup({
	default = {
		relative_to_current_file = true,

		dir_path = function()
			return vim.fn.expand("%:t:r") .. "-img"
		end,

		prompt_for_file_name = false,
		file_name = "%y%m%d-%H%M%S",

		extension = "avif",
		process_cmd = "convert - -quality 75 avif:-",
	},
})
