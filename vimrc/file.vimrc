" 
" File/CMD/Vim operations
"

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reload currect config
nmap <S-F10> :source $MYVIMRC<CR>

