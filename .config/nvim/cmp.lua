local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      --require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<c-l>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },

    -- For vsnip user.
    { name = 'vsnip' },

    -- For luasnip user.
    --{ name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
  }
})


-- vsnip config
--  " Expand
--  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
--  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
--  
--  " Expand or jump
--  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
--  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
--  
--  " Jump forward or backward
--  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--  
--  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
--  " See https://github.com/hrsh7th/vim-vsnip/pull/50
--  nmap        s   <Plug>(vsnip-select-text)
--  xmap        s   <Plug>(vsnip-select-text)
--  nmap        S   <Plug>(vsnip-cut-text)
--  xmap        S   <Plug>(vsnip-cut-text)
--  


-- lspkind-nvim
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
}
