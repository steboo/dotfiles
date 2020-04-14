setlocal textwidth=80
setlocal formatoptions-=t

" Highlight undesired whitespace like git-diff.
highlight UndesiredWhitespace ctermbg=red guibg=red
match UndesiredWhitespace /^\t\+/
match UndesiredWhitespace /\s\+$/
