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

Plug 'chriskempson/base16-vim' " Theme

Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'plasticboy/vim-markdown' " Markdown support
Plug 'octol/vim-cpp-enhanced-highlight'  " Better C++ highlighting

Plug 'scrooloose/nerdtree' " File browser
Plug 'itchyny/lightline.vim' " Bottom status bar

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter' " Git in the gutter

" Plug 'Valloric/YouCompleteMe' " LSP integration

call plug#end()

" ======================================
" Keybindings
" ======================================

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" With a map leader it's possible to do extra key combinations
" like <leader><leader> saves the current file
let mapleader = "\<Space>"

" Swap between buffers
nmap <leader><leader> <c-^>

" Fast saving
nmap <leader>w :w!<cr>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

let NERDTreeIgnore=['\.pyc$', '\~$', '^__pycache__$']
map <C-n> :NERDTreeToggle<CR>

map <leader>p :Files<cr>
map <leader>; :Buffers<cr>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ======================================
" Colors/Theming
" ======================================

set t_Co=256 "Enable 256 colors palette
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
syntax on "Enable syntax highlighting

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" Make comments orange
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

" ======================================
" General
" ======================================

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set ruler " Always show current position
set hid " A buffer becomes hidden when it is abandoned

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers

" Don't redraw while executing macros (good performance config)
set lazyredraw

set magic " For regular expressions turn magic on

set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

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
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

set splitbelow
set splitright

set nu

set clipboard=unnamed

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
