vim.o.spell = true
vim.opt.spelllang = { 'es', 'en' }

vim.keymap.set('n', '<leader>ts', '<cmd>setlocal spell!<CR>', { desc = '[T]oggle [S]pell check' })
