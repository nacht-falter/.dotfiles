-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  return
end

-- Config for nvim-cmp with Copilot
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require('luasnip/loaders/from_vscode').lazy_load()
-- require('luasnip').filetype_extend('javascript', { 'javascriptreact' })
-- require('luasnip').filetype_extend('javascript', { 'html' })

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
    ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
    ['<C-s>'] = cmp.mapping.complete(), -- show completion suggestions
    ['<C-q>'] = cmp.mapping.abort(), -- close completion window
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
  },
  -- sources for autocompletion
  sources = cmp.config.sources {
    { name = 'copilot', group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 }, -- lsp
    { name = 'luasnip', group_index = 2 }, -- snippets
    { name = 'buffer', group_index = 2 }, -- text within current buffer
    { name = 'path', group_index = 2 }, -- file system paths
  },
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format {
      maxwidth = 50,
      ellipsis_char = '...',
    },
  },
}
