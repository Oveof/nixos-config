return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = false },
      input = { enabled = false },
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        }
      },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
    keys = {
      { "<leader>sf",      function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>sg",      function() Snacks.picker.grep() end,  desc = "Grep" },
    }
  }
}
