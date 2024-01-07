--local g = vim.g
local o = vim.o
local opt = vim.opt

-- opt("o", "completeopt", "menuone,noinsert,noselect")
vim.o.shortmess = string.gsub(vim.o.shortmess, 'F', '') .. "c"

vim.cmd("syntax on")

-- vim.cmd("colorscheme morning")
-- vim.cmd("colorscheme desert")
-- vim.cmd("hi! Normal ctermbg=NONE guibg=NONE")
-- vim.cmd("filetype on")

-- vim.cmd("au BufWritePost $HOME/.config/nvim/*.{lua} so $MYVIMRC")
-- vim.cmd("filetype plugin on")
-- vim.cmd("set cc=120")

-- if file was changed, read it again
o.autoread = true

-- Disable mouse
vim.opt.mouse = ""
vim.cmd("set mouse-=a")

-- Theme & colors
-- o.termguicolors = true
-- o.background = 'dark'

-- Time in ms for a mapped sequence to complete
o.timeoutlen = 500
-- Time in ms for swap to be written to disk if nothing is being typed
o.updatetime = 50
opt.updatetime = 50


-- GENERAL
--
-- Minimal number of screenlines to keep above and below the cursor (visibility)
o.scrolloff = 8
-- display line numbers
o.number = true
-- display relative numbers from the current line (better navigation)
o.relativenumber = true
-- minimal number of columns to use for the line number
o.numberwidth = 5
-- How to draw signcolumn
o.signcolumn = "yes:2"
-- speed scrolling in vim = was removed ?
o.ttyfast = true

-- UNDO & BACKUP OPTIONS
o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember x items in commandline history
o.history = 50

-- Preserve view while jumping
o.jumpoptions = "view"

-- Clipboard - neovim clipboard + OS clipboard = sexy time
o.clipboard = "unnamedplus"

-- show (partial) command in the last line of the screen
o.showcmd = true
-- (default 1) increase number of lines for command-line
o.cmdheight = 1
-- show the line and column number of the cursor position
o.ruler = true
-- last window will have a statusline always
o.laststatus = 2
-- if modelines=0 > no lines are checked for commands
o.modelines = 0
-- show matching brackets when text indicator is over them
o.showmatch = true
-- ignore case when searching
o.ignorecase = true
-- override ignorecase if i'm using Uppercase chars
o.smartcase = true
-- highlight search results
o.hlsearch = true
-- highlight what matches as i type
o.incsearch = true
-- use the appropriate number of spaces to insert a <tab>
o.expandtab = true
--o.cindent = true
-- <Tab> in front of a line inserts blanks according to 'shiftwidth'
o.smarttab = true
o.shiftwidth = 2
o.tabstop = 2
-- better commandline tab completion
o.wildmode = "list:longest,list:full"
-- splitting a window will put the new window right of the current one.
o.splitright = true
-- show tabline always
o.showtabline = 2
-- decorate special line endings, tabs, etc
-- o.list = true
-- o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂,eol:¬,'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'
