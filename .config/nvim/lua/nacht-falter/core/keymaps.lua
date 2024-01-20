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
keymap.set("i", "<C-a>", "<C-o>$") -- jump to end of line while staying in insert mode

-- -- use jk to exit insert and visual mode
-- keymap.set('i', 'jk', '<ESC>')
-- keymap.set('v', 'jk', '<ESC>')
-- keymap.set('s', 'jk', '<ESC>')

-- search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" }) -- clear search highlights
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Globally replace current word" }) -- replace current word in the whole file

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- replace selection with register without changing register
keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace selection without changing register" })

-- use <leader>y or <leader>Y (=yy) to yank into system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection into system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line into system clipboard" })

-- keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- deletes to void register

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" }) -- equalize window sizes
keymap.set("n", "<leader>sc", ":close<CR>", { desc = "Close current window" }) -- close current window
keymap.set("n", "<leader>ss", "<C-w>x", { desc = "Swap windows" }) -- swap windows
keymap.set("n", "<leader>s>", "<C-w>5>", { desc = "Increase current split width" }) -- increase current split width
keymap.set("n", "<leader>s<", "<C-w>5<", { desc = "Reduce current split width" }) -- reduce current split width
keymap.set("n", "<leader>s+", "<C-w>5+", { desc = "Increase current split height" }) -- increase current split width
keymap.set("n", "<leader>s-", "<C-w>5-", { desc = "Reduce current split width" }) -- reduce current split width

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab

-- insert newlines without entering insert mode
keymap.set("n", "<leader>n", "o<ESC>", { desc = "Insert newline below" })
keymap.set("n", "<leader>N", "O<ESC>", { desc = "Insert newline above" })

-- swap lines
keymap.set("n", "<leader>j", "ddp", { desc = "Swap line down" })
keymap.set("n", "<leader>k", "ddkP", { desc = "Swap line up" })

-- jump to beginning/end of paragraph
keymap.set("n", "<leader>0", "{w", { desc = "Jump to beginning of paragraph" })
keymap.set("n", "<leader>$", "}ge", { desc = "Jump to end of paragraph" })
