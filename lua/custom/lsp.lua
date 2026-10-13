-- Short aliases on top of kickstart's gr* LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = event.buf, desc = 'LSP: [G]oto [D]efinition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: [G]oto [D]eclaration' })
  end,
})
