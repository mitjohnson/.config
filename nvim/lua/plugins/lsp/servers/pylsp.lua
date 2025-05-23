local filetypes = { "python" }
return {
  "neovim/nvim-lspconfig",
  ft = filetypes,
  opts = {
    servers = {
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
  },
}
