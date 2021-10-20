" Check spelling.
set spell

" Make bad spelling very obvious!.
:hi SpellBad ctermbg=red guibg=red guifg=white

" Turn on syntax highlighting
syntax on

" Make backspace work how I want it to
set backspace=indent,eol,start

" Show a column line at 72 characters for git commits
highlight ColorColumn ctermbg=0 guibg=lightgrey
autocmd Filetype gitcommit setlocal colorcolumn=72
