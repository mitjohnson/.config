return {
  "vim-test/vim-test",
  config = function()
    vim.g['test#strategy'] = 'neovim'
    vim.g['test#javascript#runner'] = 'jest'

    function ToogleTestRunner()
      if vim.g['test#javascript#runner'] == 'jest' then
        vim.g['test#javascript#runner'] = 'mocha'
        print("Switched to mocha")
      else
        vim.g['test#javascript#runner'] = 'jest'
        print("Switched to Jest")
      end
    end

    local wk = require("which-key")
    wk.add({
      { '<leader>t', group = 'Test' },
      { '<leader>tN', '<CMD>TestNearest<CR>', desc = 'Run nearest test' },
      { '<leader>tf', '<CMD>TestFile<CR>', desc = 'Run all tests in file' },
      { '<leader>ts', '<CMD>TestSuite<CR>', desc = 'Run all tests in suite' },
      { '<leader>tL', '<CMD>TestLast<CR>', desc = 'Run last test' },
      { '<leader>tv', '<CMD>TestVisit<CR>', desc = 'Visit last test file' },
      { '<leader>tR', ToogleTestRunner, desc = 'Toggle Test Runner' },
    })
  end,
}
