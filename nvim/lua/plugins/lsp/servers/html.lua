---
--- Configuration for the HTML language server. (html)
--- Provides support for HTML, HTMLOutline, and Vue files.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    html = {
      init_options = {
        provideFormatter = false,
      },
      filetypes = { 'html', 'htmldjango', 'django-html', 'vue' },
    },
  },
}
