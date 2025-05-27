---
--- Configuration for Docker Language Server (dockerls)
--- Provides LSP support for Dockerfiles.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    dockerls = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
}
