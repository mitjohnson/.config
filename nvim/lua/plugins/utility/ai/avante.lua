---@module 'avante.nvim'

return {
  'yetone/avante.nvim',
  lazy = true,
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = 'copilot',
    behavior = {
      auto_suggestions = false,
      auto_add_current_file = false,
      auto_approve_tool_permissions = false,
      disabled_tools = { 'python' },
    },
  },
  build = 'make',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
  init = function()
    local wk = require('which-key')
    wk.add({ '<leader>a', group = 'avante' })

    local prompts = {
      javascript = 'You are an expert in javascript and vue 2. You focus on writing clean, efficient, and maintainable code.'
        .. 'You have a deep understanding of modern JavaScript frameworks and libraries, and you are skilled at optimizing code for performance and readability.'
        .. 'Your suggestions are concise and to the point, providing clear guidance on how to improve the code while adhering to best practices in the JavaScript ecosystem.',

      lua = 'You are an expert in lua and neovim. You focus on writing clean, efficient, and maintainable code.'
        .. 'You have a deep understanding of lua frameworks and libraries, and you are skilled at optimizing code for performance and readability.'
        .. 'Your suggestions are concise and to the point, providing clear guidance on how to improve the code while adhering to best practices in the lua and neovim ecosystem.',
    }

    local last_prompt = nil
    local function get_prompt()
      local filetype = vim.bo.filetype

      local function prompt()
        if filetype == 'vue' then
          return prompts['javascript']
        else
          return ( prompts[filetype] or 'You are an expert programmer. You focus on writing clean, efficient, and maintainable code.')
            .. 'Your suggestions are concise and to the point, providing clear guidance on how to improve the code while adhering to best practices in software development.'
        end
      end

      local current_file_prompt = prompt()

      if current_file_prompt ~= last_prompt then
        require('avante.config').override({ system_prompt = current_file_prompt })
        vim.notify( 'Avante system prompt set for ' .. filetype, vim.log.levels.INFO, { title = 'Avante', timeout = 2000 })
        last_prompt = current_file_prompt
      end
    end

    vim.api.nvim_create_autocmd(
      { 'bufenter', 'BufRead', 'BufNewFile', 'FileType' },
      { pattern = '*.*', callback = get_prompt }
    )
  end,
}
