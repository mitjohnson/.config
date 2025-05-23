local filetypes = { "css", "scss", "less" }
return {
  'neovim/nvim-lspconfig',
  ft = filetypes,
  opts = {
    servers = {
      cssls = {
        init_options = {
          provideFormatter = false,
        },
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
  },
}
