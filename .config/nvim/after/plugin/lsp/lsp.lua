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
    keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
