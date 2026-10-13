require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = { width = 0.9, height = 0.85, preview_width = 0.6 },
      vertical = { width = 0.9, height = 0.9, preview_height = 0.6 },
    },
  },
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
}

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sa', function() builtin.find_files { hidden = true, no_ignore = true } end, { desc = '[S]earch [A]ll' })
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find {
    layout_strategy = 'horizontal',
    layout_config = { width = 0.9, height = 0.85 },
    previewer = false,
    winblend = 10,
  }
end, { desc = '[/] Fuzzily search in current buffer' })
