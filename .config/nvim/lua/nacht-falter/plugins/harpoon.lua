return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local mark = require "harpoon.mark"
    local ui = require "harpoon.ui"

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Mark current file with harpoon" })
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })
    vim.keymap.set("n", "<leader>1", function()
      ui.nav_file(1)
    end, { desc = "Go to harpoon mark 1" })
    vim.keymap.set("n", "<leader>2", function()
      ui.nav_file(2)
    end, { desc = "Go to harpoon mark 2" })
    vim.keymap.set("n", "<leader>3", function()
      ui.nav_file(3)
    end, { desc = "Go to harpoon mark 3" })
    vim.keymap.set("n", "<leader>4", function()
      ui.nav_file(4)
    end, { desc = "Go to harpoon mark 4" })
    vim.keymap.set("n", "<leader>5", function()
      ui.nav_file(5)
    end, { desc = "Go to harpoon mark 5" })
    vim.keymap.set("n", "<leader>6", function()
      ui.nav_file(6)
    end, { desc = "Go to harpoon mark 6" })
    vim.keymap.set("n", "<leader>7", function()
      ui.nav_file(7)
    end, { desc = "Go to harpoon mark 7" })
    vim.keymap.set("n", "<leader>8", function()
      ui.nav_file(8)
    end, { desc = "Go to harpoon mark 8" })
    vim.keymap.set("n", "<leader>9", function()
      ui.nav_file(9)
    end, { desc = "Go to harpoon mark 9" })
    vim.keymap.set("n", "<leader>hn", function()
      ui.nav_next()
    end, { desc = "Got to next harpoon mark" })
    vim.keymap.set("n", "<leader>hp", function()
      ui.nav_prev()
    end, { desc = "Got to previous harpoon mark" })
  end,
}
