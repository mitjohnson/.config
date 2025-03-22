return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
        "lua_ls",
        "ts_ls",
        "dockerls",
        "bashls",
        "pylsp",
        "cssls",
        "vimls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = {
            { "🭽", "FloatBorder" },
            { "▔", "FloatBorder" },
            { "🭾", "FloatBorder" },
            { "▕", "FloatBorder" },
            { "🭿", "FloatBorder" },
            { "▁", "FloatBorder" },
            { "🭼", "FloatBorder" },
            { "▏", "FloatBorder" },
          },
        }),
        ["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          {
            border = {
              { "🭽", "FloatBorder" },
              { "▔", "FloatBorder" },
              { "🭾", "FloatBorder" },
              { "▕", "FloatBorder" },
              { "🭿", "FloatBorder" },
              { "▁", "FloatBorder" },
              { "🭼", "FloatBorder" },
              { "▏", "FloatBorder" },
            },
          }
        ),
      }
      -- Init languageservers:
      lspconfig.lua_ls.setup({
        handlers = handlers,
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
          Lua = {},
        },
      })
      lspconfig.eslint.setup({
        handlers = handlers,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      lspconfig.ts_ls.setup({
        handlers = handlers,
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
        capabilities = capabilities,
        init_options = {
          vue = {
            hybridMode = false,
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
      lspconfig.html.setup({
        handlers = handlers,
        capabilities = capabilities,
        filetypes = { "html", "vue", "templ" },
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.vimls.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      -- Keybinds
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
