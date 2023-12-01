lua << EOF
require("init")
EOF

set shell=/bin/bash

" ======================================
" Plugins
" ======================================

if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !wget -P ~/.config/nvim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin()

Plug 'ellisonleao/gruvbox.nvim' " Theme

Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'plasticboy/vim-markdown' " Markdown support

Plug 'scrooloose/nerdtree' " File browser
Plug 'itchyny/lightline.vim' " Bottom status bar
Plug 'lukas-reineke/indent-blankline.nvim' " Indentation markers

Plug 'airblade/vim-gitgutter' " Git in the gutter
Plug 'tpope/vim-fugitive' " Git mode

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Semantic language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'folke/lsp-colors.nvim' " Add missing colors for diagnostics
"Plug 'ray-x/lsp_signature.nvim' " Signature help while typing

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

call plug#end()

" ======================================
" Keybindings
" ======================================

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

let NERDTreeIgnore=['\.pyc$', '\~$', '^__pycache__$']
map <C-n> :NERDTreeToggle<CR>

" search
map <leader>s :Rg<CR>

" ======================================
" Colors/Theming
" ======================================

set t_Co=256 "Enable 256 colors palette
set background=dark
syntax on "Enable syntax highlighting
set termguicolors
colorscheme gruvbox

set cmdheight=2
set updatetime=300

" ======================================
" General
" ======================================

set history=500 "Sets how many lines of history VIM has to remember

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set ruler "Always show current position
set hid "A buffer becomes hidden when it is abandoned

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

set showmatch "Show matching brackets when text indicator is over them
set mat=2 "How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf-8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set relativenumber " Relative line numbers
set number " Also show current line number

set mouse=a " Full mouse support

" Change the look of the cursor in insert vs normal mode
if !has('nvim')
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab "Use spaces instead of tabs
set smarttab "Be smart when using tabs ;)

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

set splitbelow
set splitright

set nu

set clipboard=unnamed "Share clipboard with OS

" Enable folding with za
set foldmethod=indent
set foldlevel=99

" Mark unnecessary whitespace
highlight Badwhitespace ctermbg=darkred guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.yml,*.html,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent |
    \ set expandtab

let python_highlight_all=1
