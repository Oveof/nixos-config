function obsidian_new(path)
  local fname = vim.fn.input('File: ', '', 'file')
  if fname == '' then
    return
  end
  vim.cmd('ObsidianNew ' .. path .. fname .. '.md')
end

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'coppermind',
        path = '~/coppermind',
        overrides = {
          notes_subdir = '+ Encounters',
        },
      },

      -- see below for full list of options 👇
    },
    templates = {
      folder = 'Extras/Templates',
    },
    sort_by = 'path',
    notes_subdir = '+ Encounters',
    disable_frontmatter = true,
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = 'telescope',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = '<C-x>',
        -- Insert a tag at the current location.
        insert_tag = '<C-l>',
      },
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>on', function()
      obsidian_new '+ Encounters/'
    end, { desc = 'Obsidian New note' })
  end,
}
