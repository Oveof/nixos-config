return {
  {
    'theprimeagen/harpoon',
    config = function()
      require 'harpoon'

      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>hm', function()
        mark.add_file()
      end, { desc = '[H]arpoon Mark file' })

      vim.keymap.set('n', '<leader>ht', function()
        ui.toggle_quick_menu()
      end, { desc = '[H]arpoon Mark file' })

      vim.keymap.set('n', '<A-1>', function()
        ui.nav_file(1)
      end, { desc = '[H]arpoon Goto 1' })
      vim.keymap.set('n', '<A-2>', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', '<A-3>', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', '<A-q>', function()
        ui.nav_file(4)
      end)
      vim.keymap.set('n', '<A-w>', function()
        ui.nav_file(5)
      end)
      vim.keymap.set('n', '<A-n>', function()
        ui.nav_file(1)
      end)
      vim.keymap.set('n', '<A-e>', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', '<A-i>', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', '<A-o>', function()
        ui.nav_file(4)
      end)
    end,
  },
}
