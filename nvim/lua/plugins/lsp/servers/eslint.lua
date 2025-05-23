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
      eslint = {
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine"
            },
            showDocumentation = {
              enable = true
            }
          },
          codeActionOnSave = {
            enable = false,
            mode = "all"
          },
          experimental = {
            useFlatConfig = false
          },
          format = true,
          onIgnoredFiles = "off",
          nodePath = "",
          problems = {
            shortenToSingleLine = false
          },
          quiet = false,
          run = "onType",
          useESLintClass = false,
          validate = "on",
          workingDirectory = {
            mode = "location"
          },
        }

      },
    },
  },
}
