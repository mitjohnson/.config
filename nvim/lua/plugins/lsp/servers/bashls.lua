---
--- Configuration for Bash Language Server (bashls)
--- Provides LSP support for Bash scripts.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    bashls = {
      init_options = {
        provideFormatter = false, -- Disable formatting support; use external formatters instead.
      },
    },
  },
}
