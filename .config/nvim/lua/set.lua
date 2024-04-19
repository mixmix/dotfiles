-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true
-- vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wrap = false
vim.o.autoindent = true
vim.o.smartindent = true

-- Save undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

vim.o.scrolloff = 8

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.title = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true

-- better sessions https://github.com/rmagatti/auto-session#recommended-sessionoptions-config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- always show tabline
-- vim.o.showtabline = 2

vim.opt.list = true
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  nbsp = "·",
}

-- open folds by default
vim.o.foldlevelstart = 99

-- keep centred on scroll halfpage
-- vim.o.nostartofline = true

-- vim.o.textwidth = 80

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
