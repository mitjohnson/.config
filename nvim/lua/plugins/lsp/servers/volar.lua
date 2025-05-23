local filetypes = { "vue" }
return {
  'neovim/nvim-lspconfig',
  ft = filetypes,
  opts = {
    servers = {
      volar = {
        init_options = {
          vue = {
            version = 2,
            hybridMode = true,
          },
        },
        settings = {
          typescript = {
            tsdk = vim.fn.trim(vim.fn.system('npm root -g')) .. '/typescript/lib',
            inlayHints = {
              enumMemberValues = {
                enabled = true,
              },
              functionLikeReturnTypes = {
                enabled = true,
              },
              propertyDeclarationTypes = {
                enabled = true,
              },
              parameterTypes = {
                enabled = true,
                suppressWhenArgumentMatchesName = true,
              },
              parameterNames = {
                enabled = true,
                suppressWhenArgumentMatchesName = true,
              },
              variableTypes = {
                enabled = true,
              },
            },
          },
        },
        root_dir = function()
          return vim.loop.os_homedir()
        end,
      }
    },
  },
}
