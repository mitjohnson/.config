return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
        "emmet_language_server",
        "typos_lsp",
        "cssls",
        "bashls",
        "pylsp",
        "vimls",
        "lua_ls",
        "eslint",
        "ts_ls",
        "volar",
      },
      version = {
        ["vue-language-server"] = "v2.2.8",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        opts.desc = "Show Definition"
        vim.keymap.set("n", "K", require('noice.lsp').hover, opts)

        opts.desc = "Show LSP References"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

        opts.desc = "Show LSP Type Definitions"
        vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

        opts.desc = "Show available code actions"
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer Diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

        opts.desc = "Reset LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)

        opts.desc = "Format code"
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config('lua_ls', {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
            },
          })
        end,
        settings = {
          Lua = {
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be String!
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              }
            }
          },
        },
      })
      vim.lsp.config('eslint', {
        handlers = handlers,
        on_attach = on_attach,
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
      })

      vim.lsp.config('ts_ls', {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
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
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
      })
      vim.lsp.config('volar', {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "vue" },
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
      })
      vim.lsp.config('typos_lsp', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      vim.lsp.config('html', {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "vue", "templ", "jsx", "svelte" },
      })
      vim.lsp.config('emmet_language_server', {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        { "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "typescriptreact", "htmlangular", "vue" }
      })
      vim.lsp.config('cssls', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      vim.lsp.config('dockerls', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      vim.lsp.config('bashls', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      vim.lsp.config('pylsp', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      vim.lsp.config('vimls', {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
    end,
  },
}
