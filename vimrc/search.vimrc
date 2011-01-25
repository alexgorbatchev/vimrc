" Gets the word under the cursor, and searches for it in the current directory 
" and all subdirectories, opening the quickfix window when done
nmap <leader>fw :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> :FufQuickfix<CR>
map <leader>g :vimgrep // **/* <Bar> :FufQuickfix<C-LEFT><C-LEFT><C-LEFT><C-LEFT><RIGHT>


