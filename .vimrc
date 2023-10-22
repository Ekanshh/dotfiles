" Mapping for commenting in/out lines
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" Set relative line numbers by default
set number

" Set backspace navigation
set backspace=indent,eol,start

" Set autowrap visually
set textwidth=0
set wrapmargin=0
set wrap
set linebreak 
set columns=80

" allow yank to clipboard 
 set clipboard=unnamedplus

