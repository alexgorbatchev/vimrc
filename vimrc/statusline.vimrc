set winminheight=0

"
" STATUS LINE
"
" Always hide the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" set statusline=%{CurDir()}%=%-15.(\ \ %l:%c\ %p%%%)\ %<%f%h%m\ %r%{fugitive#statusline()}
set statusline=%<%f%h%m\ %r%{fugitive#statusline()}%=%15.(%l:%c:%p%%%)

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~/", "g")
    let curdir = substitute(curdir, "//", "/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


