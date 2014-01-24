"
" A very basic .vimrc
"

set ruler
set cmdheight=2

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching
set ignorecase
set smartcase
set incsearch

" Matching braces
set showmatch
set mat=2

set noerrorbells

" Syntax color
syntax enable
colorscheme desert
set background=dark

set encoding=utf8

" No backup files (version control can handle that)
set nobackup
set nowb
set noswapfile

" Tabbing
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indentation
set ai
set si

map <leader>pp :setlocal paste!<cr>
