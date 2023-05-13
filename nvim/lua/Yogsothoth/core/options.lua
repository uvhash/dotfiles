-------------------------------------
--            OPTIONS
-------------------------------------

-- To make it easier to customize
local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 1

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

-- Case insensitive search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Disable auto commenting
vim.cmd([[
   autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- Window splits
opt.splitright = true
opt.splitbelow = true

-------------------------------------
--            LATEX
-------------------------------------

vim.cmd([[
  let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'
]])

-------------------------------------
--            APPEARENCE
-------------------------------------

-- Cursor line
opt.cursorline = false

-- Allows colorschemes to work
opt.termguicolors = true
opt.signcolumn = "yes"
