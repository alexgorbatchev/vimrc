" add a space between the comment delimiter and text
let NERDSpaceDelims=1

" Command-/ works on the Mac
nmap <D-/> :call NERDComment(0, "toggle")<CR>
vmap <D-/> <ESC>:call NERDComment(1, "toggle")<CR>
" you can use <leader>/ to do the same things.
nmap <leader>/ :call NERDComment(0, "toggle")<CR>
vmap <leader>/ <ESC>:call NERDComment(1, "toggle")<CR>

