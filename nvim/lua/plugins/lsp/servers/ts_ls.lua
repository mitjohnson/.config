local filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  "vue",
}
return {
  "neovim/nvim-lspconfig",
  ft = filetypes,
  opts = {
    servers = {
      ts_ls = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.trim(vim.fn.system('npm root -g')) .. '/@vue/typescript-plugin',
              languages = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
            },
          },
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
      filetypes = filetypes,
    },
  },
}
