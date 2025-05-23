local filetypes = {"bash", "sh"}
return {
  "neovim/nvim-lspconfig",
  ft = filetypes,
  opts = {
    servers = {
      bashls = {
        init_options = {
          provideFormatter = false,
        },
      },
    },
  },
}
