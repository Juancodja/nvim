-- Re-applied on every colorscheme change, otherwise the colorscheme resets them
local function apply()
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#968932' })
  vim.api.nvim_set_hl(0, 'SpellBad', { fg = '#ffffff', bg = '#ff0000', underline = true })
  vim.api.nvim_set_hl(0, 'SpellCap', { fg = '#ffffff', bg = '#0000ff', underline = true })
  vim.api.nvim_set_hl(0, 'SpellRare', { fg = '#ffffff', bg = '#ff00ff', underline = true })
  vim.api.nvim_set_hl(0, 'SpellLocal', { fg = '#ffffff', bg = '#00ffff', underline = true })
end

apply()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('custom-highlights', { clear = true }),
  callback = apply,
})
