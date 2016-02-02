" .gvimrc
" Last modified: 2016-02-01

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

" Light background in GUI
set background=light

" Turn off solarized menu
let g:solarized_menu=0

" Use solarized light for GUI
colorscheme solarized

set cursorline

