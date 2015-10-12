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

" Use filetype detection and plugin/indent files
filetype plugin on
filetype indent on

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
if has("folding")
    set foldenable
    set foldmethod=indent
    set foldlevelstart=10 " Open folds by default
    set foldnestmax=10
endif

" Sane backspace behavior
set backspace=indent,eol,start

" Allow arrow keys to wrap
set whichwrap+=<,>

" Ignore compiled files for tab completion
set wildignore=*.o,*~,*.pyc
if has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set wildmenu
set wildmode=list:longest

" Display
set ruler
set number " Line numbers
set visualbell
set history=700
set cursorline

" Syntax color
syntax enable
if has("gui_running")
    " Light background in GUI
    set background=light
    set t_Co=256
    if has("gui_win32")
        set guifont=Consolas:h11

        " Turn off menu in gvim
        set guioptions-=m

        " Turn off scrollbars in gvim
        set guioptions+=Llrb
        set guioptions-=Llrb
    endif
else
    " Dark background in terminal
    set background=dark

    " Let vim figure out the correct value of t_Co
    " (Hint: check value of $TERM if there are less colors than expected)
endif

if !has("gui_running") && has("win32")
    " External vim color schemes are generally not working in cmd or PowerShell
    colorscheme pablo
    set nocursorline
else
    if &t_Co == 256
        " I don't typically change terminal colors, and the README for
        " Solarized recommends that this should be set:
        let g:solarized_termcolors=256
    endif

    " Colors need to be in ~/.vim/colors (or %USERPROFILE\vimfiles\colors)
    " Fall back to something built-in if it's missing
    try
        colorscheme solarized
        "colorscheme molokai
        "colorscheme badwolf
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme desert
        set nocursorline
    endtry
endif

" Allow mouse in all modes if it's supported
" (Hold down shift to copy)
if has("mouse")
    set mouse=a
    set mousehide
endif

" Set encoding to UTF-8 on Windows
" On Linux, this will default to something based on $LANG (typically UTF-8)
if has("win32")
    set encoding=utf-8
endif

" Prepending a BOM is rarely a good idea
set nobomb

" Set nodigraph to avoid entering unexpected characters when pressing
" <char> <BS> <char>
set nodigraph

set fileformats=unix,dos

" Use PowerShell for commands on Windows
if has("win32")
    set shell=powershell\ -NoLogo
    set shellcmdflag=-Command
    set shellquote=\"
    set shellxquote=
endif

" Change to current file's directory
if exists("+autochdir")
  set autochdir
endif

" No backup files (version control can handle that)
set nobackup
set noswapfile

" Backup the file only during writing
set writebackup

" Shortcut for setting paste mode
map <leader>pp :setlocal paste!<cr>

set secure
