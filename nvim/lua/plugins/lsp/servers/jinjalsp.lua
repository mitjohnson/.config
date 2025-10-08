vim.filetype.add({
  extension = {
    jinja = 'jinja',
    j2 = 'jinja',
    jinja2 = 'jinja',
  },
})

return {
  'neovim/nvim-lspconfig',
  opts = {
    jinja_lsp = {},
  },
}
