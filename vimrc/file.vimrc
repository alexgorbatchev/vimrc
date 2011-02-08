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
