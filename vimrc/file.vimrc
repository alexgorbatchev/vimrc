" 
" File/CMD/Vim operations
"

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reload currect config
nmap <F12> :source $MYVIMRC<CR>

