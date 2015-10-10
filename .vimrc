"
" .vimrc
"

" Tabbing
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
set cindent

" Wrap lines
set wrap

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Matching braces
set showmatch
set matchtime=2

" Folding
set foldenable
set foldmethod=indent
set foldlevelstart=10 " Open folds by default
set foldnestmax=10

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
set wildmode=list:longest

" Display
set ruler
set cmdheight=2
set number " Line numbers
set visualbell
set history=700

" Syntax color
syntax enable
if has("gui_running")
    set background=light
    let g:solarized_termcolors=256
	if has("win32")
		set guifont=Consolas:h11
        set guioptions-=m
        set guioptions-=L
	endif
else
    " Let vim figure out the correct value of t_Co
    " (check value of $TERM if there are less colors than expected)
    set background=dark
    let g:solarized_termcolors=&t_Co
endif

if !has("gui_running") && (has("win16") || has("win32"))
    " External vim color schemes are generally not working with vim in cmd or PowerShell
    colorscheme pablo
else
    " Colors need to be in ~/.vim/colors (or %USERPROFILE\vimfiles\colors)
    " Fall back to something built-in if it's missing
    try
        colorscheme solarized
        "colorscheme molokai
        "colorscheme badwolf
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme desert
    endtry
endif

" Allow mouse in all modes if it's supported
" (Hold down shift to copy)
if has("mouse")
    set mouse=a
    set mousehide
endif

" Prefer default encoding
"set encoding=utf8

" Prepending a BOM is rarely a good idea
set nobomb

" Set nodigraph to avoid entering unexpected characters when pressing
" <char> <BS> <chare>
set nodigraph

set fileformats=unix,dos,mac

" Change to current file's directory
set autochdir

" Use PowerShell for commands on Windows
if has("win32")
    set shell=powershell\ -NoLogo
    set shellcmdflag=-Command
    set shellquote=\"
    set shellxquote=
endif

" No backup files (version control can handle that)
set nobackup
set noswapfile

" Backup the file only during writing
set writebackup

" Shortcut for setting paste mode
map <leader>pp :setlocal paste!<cr>

set secure
