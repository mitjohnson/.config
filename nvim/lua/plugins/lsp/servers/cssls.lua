---
--- Configuration for CSS Language Server (cssls)
--- Provides LSP support for CSS, SCSS, LESS, and Vue files.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    cssls = {
      init_options = {
        provideFormatter = false, -- Disable formatting support; use external formatters instead.
      },
      filetypes = { 'css', 'scss', 'less', 'vue' },
      settings = {
        css = {
          validate = true,
        },
        scss = {
          validate = true,
        },
        less = {
          validate = true,
        },
      },
    },
  },
}
