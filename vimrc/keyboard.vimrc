let mapleader=","

" maximize window
nmap <S-F12> :set lines=999 columns=999<CR>

" toggle wrap
nmap <leader>w :set wrap<CR>
nmap <leader>W :set nowrap<CR>

" Make Control-direction switch between windows (like C-W h, etc)
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-l> :wincmd l<CR>

" Make Alt-Command-Left/Right toggle between tabs
nmap <silent> <leader>tn :tabnew<CR>
nmap <silent> <leader>[ :tabprev<CR>
nmap <silent> <leader>] :tabnext<CR>

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" search helpers
nmap <leader>fw :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> :FufQuickfix<CR>
nmap <leader>g :vimgrep // **/* <Bar> :FufQuickfix<C-LEFT><C-LEFT><C-LEFT><C-LEFT><RIGHT>

" Gets the word under the cursor, and searches for it in the current directory 
" and all subdirectories, opening the quickfix window when done
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reload .vimrc
nmap <S-F10> :source $MYVIMRC<CR>

" disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

