local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
    return
end

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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    local keymap = vim.keymap
    keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    -- keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --  keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    --  keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    --  keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    --  keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    --  keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    --  keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    --  keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    --  keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
