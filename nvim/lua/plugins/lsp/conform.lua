---@module 'conform-nvim'

local utils = require('utils')

return {
  'stevearc/conform.nvim',
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format()
        if vim.fn.exists(':LspEslintFixAll') == 2 then
          vim.cmd('LspEslintFixAll')
        end
      end,
      desc = 'Format buffer',
    },
  },
  import = 'plugins.lsp.formatters',
  config = function(_, opts)
    local formatters = {}
    for formatter, formatter_settings in pairs(opts) do
      formatter = formatter:gsub('_', '-')
      formatters[formatter] = {
        prepend_args = function(_, ctx)
          if formatter_settings.config == true then
            if
              utils.has_local_config(
                ctx.filename,
                formatter_settings.config_names
              )
            then
              vim.notify(
                'Using local config for ' .. formatter .. ' in ' .. ctx.filename,
                vim.log.levels.INFO,
                { title = 'Conform' }
              )
              return {}
            else
              vim.notify(
                'Using global config for '
                  .. formatter
                  .. ' in '
                  .. utils.configs_location
                  .. formatter_settings.config_path,
                vim.log.levels.INFO,
                { title = 'Conform' }
              )
              return {
                formatter_settings.config_command,
                utils.configs_location .. formatter_settings.config_path,
              }
            end
          else
            return formatter_settings.prepend_args or {}
          end
        end,
      }
    end

    require('conform').setup({
      formatters = formatters,
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        vue = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        lua = { 'stylua' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
      },
    })
  end,
}
