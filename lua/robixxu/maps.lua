vim.g.mapleader = " "

local function map(mode, key, value)
	vim.keymap.set(mode, key, value, { silent = true })
end

map("n", "<LEADER>pv", vim.cmd.Ex)

-- Remap Escape
map("i", "jj", "<ESC>")
map("i", "kk", "<ESC>")
map("i", "JJ", "<ESC>")
map("i", "KK", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "<C-c>", "<ESC>")
-- Remap Escape to exit terminal mode
map("t", "<ESC>", "<C-\\><C-n>")

-- Tabs
map("", ",t", "<ESC>:tabnew<CR>")
map("", "<Left>", "<ESC>:tabp<CR>")
map("", "<Right>", "<ESC>:tabn<CR>")

-- yank till end - make Y consistent with D and C
map("", "Y", "y$")

-- split
map("i", "<C-]>", "<Esc>:vsplit<CR>")
map("v", "<C-]>", "<Esc>:vsplit<CR>")
map("n", "<C-]>", ":vsplit<CR>")

-- Switch panels focus for following modes (normal, insert, visual)
map("", "<C-h>", "<ESC><C-w>h")
map("", "<C-j>", "<ESC><C-w>j")
map("", "<C-k>", "<ESC><C-w>k")
map("", "<C-l>", "<ESC><C-w>l")
-- Switch panels focus for terminal mode
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Terminal
map("", "<C-n><C-t>", "<ESC>:terminal<CR>")

map("", "<leader>sv", "<cmd>:source $MYVIMRC<CR>")


-- visual move + auto indent
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")



-- visual paste fix 
map("x", "<leader>p", "\"_dP")

-- don't do it
map("n", "Q", "<nop>")

-- fast replace word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


