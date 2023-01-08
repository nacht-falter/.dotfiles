local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "eslint",
    "sumneko_lua",
    "tsserver",
    "html",
    "cssls",
    "emmet_ls",
    "pyright",
    "bashls",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
    }),
    -- configure lspkind for vs-code like icons
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    ----  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    --  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    --  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    --  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    --  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    --  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    --  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    --  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
