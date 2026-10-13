-- Over SSH, copy to the local clipboard via OSC52. Paste uses the unnamed register
-- (most terminals block OSC52 reads; paste from the terminal instead). See `:help clipboard-osc52`
if vim.env.SSH_CONNECTION then
  local osc52 = require 'vim.ui.clipboard.osc52'
  local function paste() return { vim.split(vim.fn.getreg '"', '\n'), vim.fn.getregtype '"' } end
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = { ['+'] = osc52.copy '+', ['*'] = osc52.copy '*' },
    paste = { ['+'] = paste, ['*'] = paste },
  }
end
