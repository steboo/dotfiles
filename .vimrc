"
" A basic .vimrc
"

" Tabbing
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
set cindent

" Searching
set ignorecase
set smartcase
set incsearch

" Matching braces
set showmatch
set mat=2

" Backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore compiled files for tab completion
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set wildmenu
set wildmode=longest,list

" Display
set ruler
set cmdheight=2
set number
"set noerrorbells
set history=700

" Syntax color
syntax enable
colorscheme desert
set background=dark

if has("gui_running")
	if has("win32")
		set guifont=Consolas:h10
	endif
endif

"set encoding=utf8

" No backup files (version control can handle that)
set nobackup
set nowb
set noswapfile

map <leader>pp :setlocal paste!<cr>
