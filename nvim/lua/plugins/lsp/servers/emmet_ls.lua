local filetypes = {
  "css",
  "eruby",
  "html",
  "htmldjango",
  "javascriptreact",
  "less",
  "pug",
  "sass",
  "scss",
  "typescriptreact",
  "htmlangular",
  "vue",
}
return {
  'neovim/nvim-lspconfig',
  ft = filetypes,
  opts = {
    servers = {
      emmet_language_server = {},
    },
  },
}
