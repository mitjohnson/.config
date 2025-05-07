return {
  {
    "williamboman/mason.nvim",
    version = "1.*",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.*",
    opts = {
      ensure_installed = {
        "html",
        "emmet_language_server",
        "typos_lsp",
        "cssls",
        "dockerls",
        "bashls",
        "pylsp",
        "vimls",
        "lua_ls",
        "eslint",
        "ts_ls",
        "volar",
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
      local lspconfig = require("lspconfig")

      local border = {
        { "🭽", "FloatBorder" },
        { "▔", "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕", "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁", "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏", "FloatBorder" },
      }

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = border,
        }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = border,
        }),
      }

      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        opts.desc = "Show Definition"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

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

        opts.desc = "Show line Diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Reset LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)

        opts.desc = "Format code"
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig.lua_ls.setup({
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
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
      lspconfig.eslint.setup({
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
          nodePath = "",
          onIgnoredFiles = "off",
          problems = {
            shortenToSingleLine = false
          },
          quiet = false,
          rulesCustomizations = {},
          run = "onType",
          useESLintClass = false,
          validate = "on",
          workingDirectory = {
            mode = "location"
          }
        }
      })
      lspconfig.ts_ls.setup({
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "javascript", "typescript", "vue" },
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
      lspconfig.volar.setup({
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
        settings = {
          typescript = {
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
              variableTypes = {
                enabled = true,
              },
            },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--log=verbose",
        },
      })
      lspconfig.typos_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.html.setup({
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "vue", "templ", "jsx", "svelte" },
      })
      lspconfig.emmet_language_server.setup({
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
      lspconfig.vimls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
      })
    end,
  },
}
