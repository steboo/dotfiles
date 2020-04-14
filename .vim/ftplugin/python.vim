" Wrap comments at 72 characters.
setlocal textwidth=72
setlocal formatoptions-=t

" Highlight undesired whitespace like git-diff.
highlight UndesiredWhitespace ctermbg=red guibg=red
match UndesiredWhitespace /^\t\+/
match UndesiredWhitespace /\s\+$/
