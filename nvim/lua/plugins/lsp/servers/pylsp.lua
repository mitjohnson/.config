---
--- Configuration for the python language server (pylsp).
--- Provides LSP support for Python files.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            autopep8 = { enabled = false },
            flake8 = { enabled = true },
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
            pylint = { enabled = true },
            yapf = { enabled = false },
          },
        },
      },
    },
  },
}
