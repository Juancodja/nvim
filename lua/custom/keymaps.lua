-- Insert empty line below (only in normal buffers, keeps <CR> working in quickfix/cmdwin)
vim.keymap.set('n', '<CR>', function() return vim.bo.buftype == '' and "<cmd>put =''<CR>" or '<CR>' end, { expr = true, desc = 'Insert empty line below' })
vim.keymap.set('n', '<BS>', 'X', { desc = 'Delete char before cursor' })

-- Reload files changed outside of Neovim
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  group = vim.api.nvim_create_augroup('custom-checktime', { clear = true }),
  command = "if mode() != 'c' | checktime | endif",
})
