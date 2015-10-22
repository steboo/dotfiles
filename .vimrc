" .vimrc
" 2015-10-21

" -----------------
" Editor behavior
" -----------------

" Tabs or whitespace
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
if has("cindent")
    set cindent
elseif has("smartindent")
    set smartindent
endif

" Use filetype detection and plugin/indent files
filetype plugin on
filetype indent on


" --------------
" Line endings
" --------------

set fileformats=unix,dos


" -----------------
" Search behavior
" -----------------

set ignorecase
set smartcase
if has("extra_search")
    set incsearch
    set hlsearch
endif


" ----------
" Controls
" ----------

" Sane backspace behavior
set backspace=indent,eol,start

" Allow arrow keys to wrap
set whichwrap+=<,>

" Ignore compiled files for tab completion
if has("wildignore")
    set wildignore=*.o,*~,*.pyc,*.pyo
    if has("win32")
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    else
        set wildignore+=.git\*,.hg\*,.svn\*
    endif
endif
if has("wildmenu")
    set wildmenu
endif
set wildmode=longest:full

" Set nodigraph to avoid entering unexpected characters when pressing
" <char> <BS> <char>
if has("digraphs")
    set nodigraph
endif


" -----------------
" Visual behavior
" -----------------

" Visually wrap lines
set wrap
if has("linebreak")
    set linebreak
endif

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

" Misc display
if has("cmdline_info")
    set ruler
endif
set number " Line numbers
set visualbell
set history=700
set cursorline

" gvim settings
if has("gui")
    if has("win32")
        set guifont=Consolas:h11
    endif

    " Turn off menu tearoffs
    set guioptions-=t

    " Turn off scrollbars
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
endif

" Syntax color
syntax enable
if has("gui_running")
    " Light background in GUI
    set background=light

    " Turn off solarized menu
    let g:solarized_menu=0

    " Use solarized light for GUI
    colorscheme solarized
else
    " Dark background in terminal
    set background=dark

    " Let vim figure out the correct value of t_Co
    " (Hint: check value of $TERM if there are less colors than expected)

    if &t_Co < 256
        " Use a basic color scheme for terminals lacking in colors
        try
            colorscheme pablo
        catch /^Vim\%((\a\+)\)\=:E185/
        endtry

        " cursorline looks terrible with low colors
        set nocursorline
    else
        if &t_Co == 256
            " I don't typically change terminal colors, and the README for
            " solarized recommends that this should be set:
            let g:solarized_termcolors=256
        endif

        " Colors need to be in ~/.vim/colors (or %USERPROFILE\vimfiles\colors)
        " Fall back to something built-in if it's missing
        try
            " solarized dark does not have high enough contrast for me
            "colorscheme solarized

            " molokai and badwolf use bold fonts which do not display nicely in
            " PuTTY with Consolas + ClearType
            " (Note: PuTTY can be patched, see http://stackoverflow.com/a/2581889/25295)
            "colorscheme molokai
            "colorscheme badwolf

            "colorscheme Tomorrow-Night
            colorscheme railscast
        catch /^Vim\%((\a\+)\)\=:E185/
            try
                colorscheme pablo
            catch /^Vim\%((\a\+)\)\=:E185/
            endtry

            set nocursorline
        endtry
    endif
endif


" -------
" Mouse
" -------

" Allow mouse in all modes except insert if it's supported
" (Hold down shift to copy)
if has("mouse")
    set mouse=nvc
    set mousehide

    " Resize buffers with mouse in tmux/screen
    if &term == "screen-256color"
        set ttymouse=xterm2
    endif
endif


" ----------
" Encoding
" ----------

" Set encoding to UTF-8 on Windows
" On Linux, this will default to something based on $LANG (typically UTF-8)
if has("multi_byte")
    if has("win32")
        set encoding=utf-8
    endif

    " Prepending a BOM in utf-8 is rarely a good idea
    if &encoding == "utf-8"
        set nobomb
    endif
endif


" ----------------
" Shell commands
" ----------------

" Use PowerShell for commands on Windows
if has("win32")
    set shell=powershell\ -NoLogo
    set shellcmdflag=-Command
    set shellquote=\"
    set shellxquote=
endif


" ---------------
" Miscellaneous
" ---------------

" Backup the file only during writing
set nobackup
if has("writebackup")
    set writebackup
endif

" Put swap files somewhere else to avoid cluttering the current directory
" A trailing slash for the location makes vim use the full path name in the
" file name.
if has("unix")
    set swapfile
    set directory=~/.vim/tmp//,$HOME/tmp//,/tmp//,/var/temp//,.
else
    set noswapfile
endif

" Shortcut for setting paste mode
map <leader>pp :setlocal paste!<cr>

map <F1> <nop>

set secure
