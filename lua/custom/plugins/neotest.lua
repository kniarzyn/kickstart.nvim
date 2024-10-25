return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-rspec',
    'nvim-neotest/neotest-go',
    'zidhuss/neotest-minitest',
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    require('neotest').setup {
      adapters = {
        require 'neotest-rspec',
        require 'neotest-minitest',
        require 'neotest-go',
      },
    }
    vim.keymap.set('n', '<Leader>mtt', ':lua require("neotest").run.run()<CR>', { desc = 'Run single test' })
    vim.keymap.set('n', '<Leader>mo', ':lua require("neotest").output.open({enter = true})<CR>', { desc = 'Open test results' })
  end,
}
