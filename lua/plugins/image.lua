require("image").setup({
	integrations = {
		markdown = {
			clear_in_insert_mode = true,
			only_render_image_at_cursor = true,
			only_render_image_at_cursor_mode = "inline",
		},
	},
})
