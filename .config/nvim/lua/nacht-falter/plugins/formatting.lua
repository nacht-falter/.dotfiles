return {
  "stevearc/conform.nvim",
  lazy = true,

  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require "conform"
    local fidget = require "fidget"

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        lua = { "stylua" },
        python = { "autoflake", "isort", "autopep8" },
        sh = { "shfmt" },
        php = { "phpcbf" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    }

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
      fidget.notify("Formatting done")
    end, { desc = "Format file" })
  end,
}
