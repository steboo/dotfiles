" .gvimrc

if has('win32')
    set guifont=Consolas:h11
    if has('directx') && &encoding ==# 'utf-8'
      " Enable ClearType
      set renderoptions=directx,taamode:1
    endif
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
set laststatus=2

" vim:set et sw=4:
