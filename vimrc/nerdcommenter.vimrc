" add a space between the comment delimiter and text
let NERDSpaceDelims=1

" Use Control-/ to toggle comments
nmap <C-/> :call NERDComment(0, "toggle")<CR>
vmap <C-/> <ESC>:call NERDComment(1, "toggle")<CR>
" Command-/ works on the Mac
nmap <D-/> <ESC>:call NERDComment(1, "toggle")<CR>
vmap <D-/> <ESC>:call NERDComment(1, "toggle")<CR>
" but most vim implementations produce Control-_ instead of Control-/:
nmap <C-_> :call NERDComment(0, "toggle")<CR>
vmap <C-_> <ESC>:call NERDComment(1, "toggle")<CR>
" and vim-gtk and vim-gnome are broken
" you can use <leader>/ to do the same things.
nmap <leader>/ :call NERDComment(0, "toggle")<CR>
vmap <leader>/ <ESC>:call NERDComment(1, "toggle")<CR>
" but maybe <leader>C is nicer to type?
nmap <leader>C  :call NERDComment(0, "toggle")<CR>
vmap <leader>C <ESC>:call NERDComment(1, "toggle")<CR>

