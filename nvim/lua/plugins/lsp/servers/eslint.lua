---
--- Configuration for ESLint Language Server (eslint)
--- Provides LSP support for linting and formatting JavaScript and TypeScript files.
---

local utils = require('utils')
return {
  'neovim/nvim-lspconfig',
  opts = {
    eslint = {
      handlers = {
        ['eslint/noConfig'] = function(_, _, ctx)
          --- Handle missing ESLint configuration.
          --- Dynamically updates the ESLint options to use a custom config file.
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          if client and client.config.settings then
            client.config.settings.options = client.config.settings.options
              or {}
            client.config.settings.options.overrideConfigFile = utils.configs_location
              .. '/.eslintrc.json' -- Replace with the actual path.
            vim.notify(
              'No ESLint config found. Using custom config: /path/to/your/.eslintrc.json',
              vim.log.levels.WARN
            )
            -- Notify the client to reload the settings.
            client.notify(
              'workspace/didChangeConfiguration',
              { settings = client.config.settings }
            )
          end
        end,
      },
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = 'separateLine',
          },
          showDocumentation = {
            enable = true,
          },
        },
        codeActionOnSave = {
          enable = true,
          mode = 'all',
        },
        experimental = {
          useFlatConfig = false,
        },
        format = false, -- Disable formatting; use external formatters.
        onIgnoredFiles = 'off',
        nodePath = '',
        problems = {
          shortenToSingleLine = false,
        },
        quiet = false,
        run = 'onType',
        useESLintClass = false,
        validate = 'on',
        workingDirectory = {
          mode = 'location',
        },
      },
    },
  },
}
