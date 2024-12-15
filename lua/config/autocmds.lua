-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Indent colors
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#002B36", bg = "NONE", nocombine = true })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#494FB6", bg = "NONE", nocombine = true })

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})
