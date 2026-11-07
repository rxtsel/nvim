local M = {}

function M.source_definition()
	local bufnr = vim.api.nvim_get_current_buf()
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "vtsls" })[1]
	if not client then
		Snacks.picker.lsp_implementations()
		return
	end

	local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
	client:exec_cmd({
		command = "typescript.goToSourceDefinition",
		arguments = { params.textDocument.uri, params.position },
	}, { bufnr = bufnr }, function(err, locations)
		if err then
			vim.notify(err.message, vim.log.levels.ERROR)
		elseif not locations or #locations == 0 then
			vim.notify("No source definition found", vim.log.levels.INFO)
		else
			vim.lsp.util.show_document(locations[1], client.offset_encoding, { focus = true, reuse_win = true })
		end
	end)
end

return M
