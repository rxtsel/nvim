return {
	"axelvc/template-string.nvim",
	keys = "$",
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	opts = {
		remove_template_string = true, -- remove backticks when there are no template string
		restore_quotes = {
			-- quotes used when "remove_template_string" option is enabled
			normal = [["]],
			jsx = [["]],
		},
	},
}
