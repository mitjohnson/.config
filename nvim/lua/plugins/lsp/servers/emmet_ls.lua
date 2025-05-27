---
--- Configuration for Emmet Language Server (emmet_language_server)
--- Provides LSP support for Emmet abbreviations in various file types.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    emmet_language_server = {
      filetyoes = {
        'html',
        'css',
        'scss',
        'less',
        'vue',
        'javascriptreact',
        'typescriptreact',
      },
    },
  },
}
