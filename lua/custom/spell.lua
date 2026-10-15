vim.o.spell = true
vim.opt.spelllang = { 'es', 'en' }

vim.keymap.set('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = '[T]oggle [S]pell check' })

-- No spell check in file explorers (netrw / built-in directory viewer)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'netrw', 'directory' },
  callback = function() vim.opt_local.spell = false end,
})
