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


vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Terminal
map("", "<C-n><C-t>", "<ESC>:terminal<CR>")

map("n", "<leader>sv", "<cmd>:source $MYVIMRC<CR>")


-- visual move + auto indent
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")



-- visual paste fix 
--map("x", "<leader>p", "\"_dP")

-- don't do it
map("n", "Q", "<nop>")

-- fast replace word under cursor
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

map('n', '<leader>aa', '<cmd>ArduinoAttach<CR>')
map('n', '<leader>av', '<cmd>ArduinoVerify<CR>')
map('n', '<leader>au', '<cmd>ArduinoUpload<CR>')
map('n', '<leader>aus', '<cmd>ArduinoUploadAndSerial<CR>')
map('n', '<leader>as', '<cmd>ArduinoSerial<CR>')
map('n', '<leader>ab', '<cmd>ArduinoChooseBoard<CR>')
map('n', '<leader>ap', '<cmd>ArduinoChooseProgrammer<CR>')

map("n", "<leader>lg", "<cmd>LazyGit<CR>")

-- map("i","<C-CR>", require("copilot").accept())
-- vim.opt_global.copilot_no_tab_map = true
        -- imap <silent><script><expr> <C-J> 
        -- let g:copilot_no_tab_map = v:true

