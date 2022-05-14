local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
	return
end

comment.setup({
	marker_padding = true,
	comment_empty = true,
	create_mappings = true,
})
