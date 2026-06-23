-- See for install: https://github.com/artempyanykh/marksman/blob/main/docs/install.md

---@type vim.lsp.Config
return {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown', 'markdown.mdx' },
    root_markers = { '.marksman.toml', '.git' },
}
