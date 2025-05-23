local filetypes = { "dockerfile" }
return {
  'neovim/nvim-lspconfig',
  ft = filetypes,
  opts = {
    servers = {
      dockerls = {
        languageserver = {
          formatter = {
            ignoreMultilineInstructions = true,
          },
        },
      },
    },
  },
}
