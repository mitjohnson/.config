local utils = require("utils")

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
  import = "plugins.lsp.formatters",
  opts = function(_, opts)
    for formatter, formatter_settings in pairs(opts) do
      opts[formatter] = {
        prepend_args = function(_, ctx)
          if utils.has_local_config(ctx.filename, formatter_settings.config_names) then
            return {}
          else
            return {
              formatter_settings.config_command,
              utils.configs_location .. formatter_settings.config_path,
            }
          end
        end,
      }
    end

    opts.formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      lua = { "stylua" },
      bash = { "shfmt" },
    }
  end,
}
