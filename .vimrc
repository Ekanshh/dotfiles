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

" allow select all at once
nnoremap <leader>a ggVG

" Move current selected lines up/down
fun! SwitchLine(src_line_idx,direction, mode)
    if a:direction ==# 'up'
        if a:mode ==# 'n' || a:mode ==# 'i'
            " Normal or Insert mode
            if a:src_line_idx > 1
                execute a:src_line_idx . 'move-2'
            endif
        elseif a:mode ==# 'v'
            " Visual mode
            if a:src_line_idx > 1
                execute ":m '>+1<CR>gv=gv"
            endif
        endif
    elseif a:direction ==# 'down'
        if a:mode ==# 'n' || a:mode ==# 'i'
            " Normal or Insert mode
            if a:src_line_idx < line('$')
                execute a:src_line_idx . 'move+1'
            end
        elseif a:mode ==# 'v'
            " Visual mode
            if a:src_line_idx < line('$')
                execute ":m '<-2<CR>gv=gv"
            end
        end
    endif
endfunction

nnoremap <silent> <S-Down> :call SwitchLine(line('.'), 'down', 'n')<CR>
nnoremap <silent> <S-Up> :call SwitchLine(line('.'), 'up', 'n')<CR>
inoremap <silent> <S-Up> <Esc>:call SwitchLine(line('.'), 'up', 'i')<CR>
inoremap <silent> <S-Down> <Esc>:call SwitchLine(line('.'), 'down', 'i')<CR>
vnoremap <silent> <S-Up> :m '>-2<CR>gv=gv
vnoremap <silent> <S-Down> :m '<+1<CR>gv=gv
