local keymap = vim.keymap

vim.g.mapleader = " "

-------------------------------------------------------------------
--                       INSERT MODE REMAPS
-------------------------------------------------------------------

-- Match curly braces
-- keymap.set("i", "{<cr>", "{<cr>}<c-o><s-o>")

-------------------------------------------------------------------
--                       NORMAL MODE REMAPS
-------------------------------------------------------------------

-- Save and quit from a file
-- keymap.set("n", "<leader>wq", ":wq<CR>")

-- Clears highlighting, and errors
keymap.set("n", "<esc><esc>", ":noh<return>")

-- Delete a character without copying it
keymap.set("n", "x", '"_x')

-- increment/decrement number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make splits equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

--keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
--keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
--keymap.set("n", "<leader>se", "<C-w>=") -- make splits equal
--keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

--keymap.set("n", "<leader>to", ":tabnew<CR>") -- create new tab
--keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close new tab
--keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
--keymap.set("n", "<leader>tp", ":tabp<CR>") -- go back to previous tab

-------------------------------------------------------------------
--                       PLUGIN REMAPS
-------------------------------------------------------------------

-- maximize and restore current window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- launch and close nvim tree
keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>id", "<cmd>Workspace LeftPanelToggle<CR>")
keymap.set("n", "<leader>ig", "<cmd>Workspace RightPanelToggle<CR>")

--Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files in current working directory
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working direcroty
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current nvim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Create a key mapping to open the menu
keymap.set("n", "<leader>ch", "<cmd>lua create_chess_menu()<cr>", { noremap = true, silent = true })
