---
--- Configuration for the vue language server (vue_ls).
--- Provides LSP support for Vue.js files.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    vue_ls = {
      init_options = {
        typescript = {
          tsdk = vim.fn.trim(vim.fn.system('npm root -g')) .. '/typescript/lib', -- Path to the global TypeScript SDK
        },
        vue = {
          version = 2,
          hybridMode = true,
        },
      },
      root_dir = function()
        return vim.loop.os_homedir()
      end,
    },
  },
}
