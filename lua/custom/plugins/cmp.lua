-- ~/.config/nvim/lua/custom/plugins/cmp.lua
return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs', -- para integración con autopairs
    },
    opts = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- Integración con autopairs
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
      }
    end,
  },
}
