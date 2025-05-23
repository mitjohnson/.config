local filetyples = { "html", "templ" }
return {
  "neovim/nvim-lspconfig",
  ft = filetyples,
  opts = {
    servers = {
      html = {
        init_options = {
          provideFormatter = false,
        },
      }
    },
  }
}

