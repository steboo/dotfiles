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
set wrap " Wrap lines

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Matching braces
set showmatch
set matchtime=2

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
set number " Line numbers
"set noerrorbells
set visualbell
set history=700

" Syntax color
syntax enable
if has("gui_running")
    set background=light
    let g:solarized_termcolors=256
	if has("win32")
		set guifont=Consolas:h10
	endif
else
    set background=dark
    let g:solarized_termcolors=16
endif

" Colors need to be in ~/.vim/colors (or %USERPROFILE\vimfiles\colors)
" Fall back to something built-in if it's missing
try
    colorscheme solarized
    "colorscheme molokai
    "colorscheme badwolf
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" Allow mouse in all modes if it's supported
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
" Most people seem to set no writebackup, but I don't see the value in that
set nobackup
set noswapfile

" Shortcut for setting paste mode
map <leader>pp :setlocal paste!<cr>

" Fun function to show all the color schemes
" call DisplayColorSchemes()
" http://stackoverflow.com/a/26074629
function! DisplayColorSchemes()
   let currDir = getcwd()
   exec "cd $VIMRUNTIME/colors"
   for myCol in split(glob("*"), '\n')
      if myCol =~ '\.vim'
         let mycol = substitute(myCol, '\.vim', '', '')
         exec "colorscheme " . mycol
         exec "redraw!"
         echo "colorscheme = ". myCol
         sleep 2
      endif
   endfor
   exec "cd " . currDir
endfunction

set secure
