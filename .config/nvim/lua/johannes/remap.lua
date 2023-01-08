vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- Cursor position
keymap.set("n", "J", "mzJ`z") -- keeps cursor in place when joining lines 

keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle when using Ctrl-D to navigate
keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle when using Ctrl-U to navigate
keymap.set("n", "n", "nzzzv") -- keep cursor in the middle when navigating search results
keymap.set("n", "N", "Nzzzv") -- keep cursor in the middle when navigating search results
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- make J and K move selection down or up in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- make J and K move selection down or up in visual mode

-- file explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open vim file explorer

-- use jk to exit insert and visual mode
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")

-- search
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace current word in the whole file

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- replace selection with buffer without changing buffer
keymap.set("x", "<leader>p", [["_dP]])

-- use <leader>y or <leader>Y (=yy) to yank into system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- deletes to void register

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- insert newlines without entering insert mode
keymap.set("n", "<leader>n", "o<ESC>")
keymap.set("n", "<leader>N", "O<ESC>")

-- swap lines
keymap.set("n", "<leader>j", "ddp")
keymap.set("n", "<leader>k", "ddkP")

-- jump to beginning/end of paragraph
keymap.set("n", "<leader>0", "{w")
keymap.set("n", "<leader>$", "}ge")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fsc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gac", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gf", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
