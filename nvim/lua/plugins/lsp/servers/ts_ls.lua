---
--- Confiuration for the TypeScript Language Server (ts_ls) with Vue support.
--- Provides LSP support for TypeScript, JavaScript, and Vue files.
---
return {
  'neovim/nvim-lspconfig',
  opts = {
    ts_ls = {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.fn.trim(vim.fn.system('npm root -g'))
              .. '/@vue/typescript-plugin', -- Path to the global Vue/TypeScript plugin
            languages = { 'javascript', 'typescript', 'vue' },
          },
        },
      },
      filetypes = { 'javascript', 'typescript', 'vue' },
    },
  },
}
