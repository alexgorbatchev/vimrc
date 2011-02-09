" 
" File/CMD/Vim operations
"

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reload currect config
nmap <S-F10> :source $MYVIMRC<CR>

" use mac, unix and dos encodings
" http://vim.wikia.com/wiki/File_format
set ffs=mac,unix,dos


" actioscript
au BufNewFile,BufRead *.as set filetype=actionscript
autocmd FileType actionscript setlocal shiftwidth=4 softtabstop=4 noexpandtab

" python
autocmd FileType python       setlocal shiftwidth=4 softtabstop=4 expandtab

" ruby
autocmd FileType ruby         setlocal shiftwidth=2 softtabstop=2 expandtab

