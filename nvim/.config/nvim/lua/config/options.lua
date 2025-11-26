local opt = vim.opt

opt.backspace = { "eol", "start", "indent" }
opt.whichwrap:append("<,>,h,l")
opt.termguicolors = true
opt.cmdheight = 2
opt.updatetime = 300
opt.history = 500
opt.autoread = true
opt.ruler = true
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.lazyredraw = true
opt.showmatch = true
opt.matchtime = 2
opt.errorbells = false
opt.visualbell = false
opt.timeoutlen = 500
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.relativenumber = true
opt.number = true
opt.mouse = "a"
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.linebreak = true
opt.textwidth = 500
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.laststatus = 2
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamed"
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.background = "dark"

vim.cmd([[
  syntax on
  highlight BadWhitespace ctermbg=darkred guibg=darkred
]])
